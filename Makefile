# King's Valley II - The Seal of El Giza (Konami, 1988)
# desensamblado de sus DOS cartuchos: RC-760 para MSX y RC-761 para MSX2
#
# El orden de las cosas: trazar el flujo -> generar el listado -> comprobar que
# vuelve a dar la ROM byte a byte -> las comprobaciones que el reensamblado NO
# cubre.
#
# Los dos son MegaROM de 128 KB con el mapper Konami CON SCC, 16 bancos de
# 8 KB. Cada banco es un modulo (p00..p15) con su propio org -el sitio donde el
# mapper lo pone para ejecutarlo, medido en tools/paginas.py-, su trazado, sus
# notas y su listado. Los seis bancos que son iguales byte a byte en los dos
# cartuchos (4, 5, 6, 10, 11 y 13) se desensamblan UNA vez, en src/comun, y
# entran en los dos; el resto va en src/msx1 o src/msx2 (tools/fuentes.py).
#
# Las ordenes de cada cartucho llevan VARIANTE=msx1 o VARIANTE=msx2 (las
# herramientas la leen del entorno, tools/variante.py). Las de arriba del todo
# (all, verify, sanity, listado...) hacen las dos:
#
#     make verify                  los dos cartuchos
#     make verify VARIANTE=msx2    solo el de MSX2
#
# La ROM no se distribuye. Hacen falta en la raiz kv2_msx1.rom y kv2_msx2.rom,
# y `make comprueba` verifica los sha256.

PREFIJO  = kv2
SRC      = src
WORK     = work
COMUNES  = 04 05 06 10 11 13
PAGINAS  = 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15

SHA_msx1 = 87a51e8744c0dafa0ab27d8b3b16585cfb5f76673ec62ad05c49c58384ce81b8
SHA_msx2 = c7f138f16ddb8c8bf7af2fbd136c1f949ab95c375205375a3509d8ad32e00d93
RC_msx1  = RC-760
RC_msx2  = RC-761
MAQ_msx1 = MSX
MAQ_msx2 = MSX2

# Donde se ejecuta cada banco. Es la misma tabla que `python3 tools/paginas.py
# lista` (un test lo comprueba), igual en los dos cartuchos; esta copiada aqui
# para no lanzar python 32 veces por cada make.
ORG_00 = 0x4000
ORG_01 = 0x6000
ORG_02 = 0x8000
ORG_03 = 0xa000
ORG_04 = 0x6000
ORG_05 = 0x8000
ORG_06 = 0xa000
ORG_07 = 0x6000
ORG_08 = 0x8000
ORG_09 = 0xa000
ORG_10 = 0x6000
ORG_11 = 0x8000
ORG_12 = 0xa000
ORG_13 = 0xa000
ORG_14 = 0x8000
ORG_15 = 0xa000
ORG    = $(ORG_$(1))

VARIANTES = msx1 msx2

ifeq ($(VARIANTE),)
# --------------------------------------------------------------------------
# Sin VARIANTE: cada orden se repite para los dos cartuchos.
# --------------------------------------------------------------------------
all comprueba reconoce listado trace verify sanity densidad:
	@for v in $(VARIANTES); do \
	  echo "################ $$v ################"; \
	  $(MAKE) --no-print-directory VARIANTE=$$v $@ || exit 1; \
	done

# Las semillas de los bancos comunes juntan las de los dos cartuchos: primero
# se trazan los dos enteros y luego se reparten.
semillas:
	@for v in $(VARIANTES); do $(MAKE) --no-print-directory VARIANTE=$$v semillas-traza || exit 1; done
	@for v in $(VARIANTES); do VARIANTE=$$v python3 tools/reparte.py semillas || exit 1; done

else
# --------------------------------------------------------------------------
# Un cartucho: VARIANTE=msx1 o VARIANTE=msx2.
# --------------------------------------------------------------------------
export VARIANTE
ROM      = $(PREFIJO)_$(VARIANTE).rom
SHA      = $(SHA_$(VARIANTE))
TITULO   = KING'S VALLEY II - Konami (1988) - $(MAQ_$(VARIANTE)) - MegaROM $(RC_$(VARIANTE)) de 128 KB (Konami SCC)

# La parte de cada banco: comun o la variante.
PARTE    = $(if $(filter $(1),$(COMUNES)),comun,$(VARIANTE))
DS       = $(SRC)/$(call PARTE,$(1))
DW       = $(WORK)/$(call PARTE,$(1))
LISTADO  = $(if $(filter $(1),$(COMUNES)),$(SRC)/comun/$(PREFIJO)_p$(1).asm,$(SRC)/$(VARIANTE)/$(PREFIJO)_$(VARIANTE)_p$(1).asm)
TITULO_B = $(if $(filter $(1),$(COMUNES)),KING'S VALLEY II - Konami (1988) - MSX y MSX2 - RC-760 y RC-761 (Konami SCC),$(TITULO))

all: listado verify sanity

$(ROM):
	@echo "=================================================================="
	@echo " Falta $(ROM), y este repositorio NO lo distribuye."
	@echo ""
	@echo " Es King's Valley II (Konami, $(RC_$(VARIANTE)), 1988) para"
	@echo " $(MAQ_$(VARIANTE)), 131072 bytes exactos. Ponlo aqui con ese nombre."
	@echo " Para comprobar que es el mismo:"
	@echo "     shasum -a 256 $(ROM)"
	@echo "     $(SHA)"
	@echo ""
	@echo " Sin el se puede leer el listado ya generado en $(SRC)/, y los"
	@echo " tests que no dependen del binario siguen pasando."
	@echo "=================================================================="
	@false

comprueba: $(ROM)
	@echo "$(SHA)  $(ROM)" | shasum -a 256 -c -

# Reconocimiento: cabecera, escrituras al mapper, y la comprobacion de que la
# regla banco -> org la cumplen todas las escrituras.
reconoce: $(ROM)
	@python3 tools/reconocimiento.py $(ROM)

# Los 16 bancos cortados de la ROM: los propios en work/<variante>, los
# comunes en work/comun (tools/reparte.py comprueba que son iguales).
$(WORK)/$(VARIANTE)/p00.bin: $(ROM) tools/reparte.py
	python3 tools/reparte.py corta

paginas: $(WORK)/$(VARIANTE)/p00.bin

# El trazado de cartucho entero, que es el unico que sabe que banco hay en
# cada ranura: escribe los .entries y .nocode en work/<variante>/semillas
# (luego `make semillas` sin VARIANTE los reparte).
semillas-traza: $(ROM) $(WORK)/$(VARIANTE)/p00.bin
	@mkdir -p $(WORK)/$(VARIANTE)/semillas
	python3 tools/bancos.py $(ROM) escribe $(SRC)/$(VARIANTE) $(WORK)/$(VARIANTE)/semillas

# El trazado sigue el flujo desde los puntos de entrada DE CADA BANCO.
define REGLA_TRAZA
$(call DW,$(1))/p$(1).trace.json: $(WORK)/$(VARIANTE)/p00.bin $(call DS,$(1))/p$(1).entries $(call DS,$(1))/p$(1).nocode tools/z80trace.py
	python3 tools/z80trace.py $(call DW,$(1))/p$(1).bin $(call ORG,$(1)) $(call DS,$(1))/p$(1).entries \
	        $(call DW,$(1))/p$(1) $(call DS,$(1))/p$(1).nocode
endef
$(foreach p,$(PAGINAS),$(eval $(call REGLA_TRAZA,$(p))))

trace: $(foreach p,$(PAGINAS),$(call DW,$(p))/p$(p).trace.json)

# Un listado por banco, con el org de ese banco.
define REGLA_LISTADO
$(call LISTADO,$(1)): $(call DW,$(1))/p$(1).trace.json $(call DS,$(1))/p$(1).notes tools/mkasm.py
	python3 tools/mkasm.py $(call DW,$(1))/p$(1).bin $(call ORG,$(1)) $(call DW,$(1))/p$(1).trace.json \
	        $(call DS,$(1))/p$(1).notes $(WORK)/msx.sym $(call LISTADO,$(1)) \
	        "$(call TITULO_B,$(1)) - banco $(1) (se ejecuta en $(call ORG,$(1)))"
endef
$(foreach p,$(PAGINAS),$(eval $(call REGLA_LISTADO,$(p))))

listado: $(foreach p,$(PAGINAS),$(call LISTADO,$(p)))

# La prueba que decide si el desensamblado es fiable: cada banco reensambla a
# sus 8192 bytes, y los 16 concatenados dan la ROM entera.
verify: $(WORK)/$(VARIANTE)/p00.bin
	@mkdir -p $(WORK)/$(VARIANTE)/rehecha
	@$(foreach p,$(PAGINAS),sh tools/verify_build.sh $(call LISTADO,$(p)) $(call DW,$(p))/p$(p).bin \
	     $(call ORG,$(p)) $(WORK)/$(VARIANTE)/rehecha/p$(p).out.bin || exit 1;)
	@sh tools/verify_rom.sh $(WORK)/$(VARIANTE)/rehecha $(ROM) $(SHA)

# Lo que el reensamblado NO puede cazar: que unos datos se esten leyendo como
# codigo.
sanity: trace
	@echo "=================================================================="
	@echo " la regla banco -> org la cumplen todas las escrituras al mapper"
	@echo "=================================================================="
	@python3 tools/reconocimiento.py $(ROM) | tail -1
	@echo "=================================================================="
	@echo " ningun byte declarado como datos puede salir como codigo"
	@echo "=================================================================="
	@$(foreach p,$(PAGINAS),python3 tools/check_trace.py $(call DW,$(p))/p$(p).trace.json $(call DS,$(p))/p$(p).nocode | tail -1 || exit 1;)
	@python3 tools/check_datos_como_codigo.py $(WORK) $(SRC)
	@echo "=================================================================="
	@echo " el trazado por bancos y el de cartucho entero dicen lo mismo"
	@echo "=================================================================="
	@python3 tools/check_bancos.py $(ROM) $(WORK) $(SRC)/$(VARIANTE)
	@echo "=================================================================="
	@echo " ningun punto de entrada puede caer dentro de una zona de datos"
	@echo "=================================================================="
	@$(foreach p,$(PAGINAS),python3 tools/check_entradas.py $(call DS,$(p))/p$(p).entries $(call DS,$(p))/p$(p).notes \
	          $(call DS,$(p))/p$(p).nocode | tail -1 || exit 1;)
	@echo "=================================================================="
	@echo " ni un byte del cartucho sin asignar (los 16 bancos)"
	@echo "=================================================================="
	@python3 tools/presupuesto.py $(WORK) $(SRC)

densidad:
	@$(foreach p,$(PAGINAS),echo "-- p$(p)"; python3 tools/densidad.py $(call LISTADO,$(p)) | tail -2;)

endif

# La web: en el repositorio solo van las paginas en markdown; GitHub Pages las
# convierte con Jekyll (tools/jekyll.py escribe su configuracion y plantillas).
# Las paginas las escribe tools/paginas_web.py y la portada make_web.py, con lo
# de tools/contenido_web.py. Para comprobar los enlaces se construye en local
# con el mismo Jekyll (3.10).
JEKYLL ?= C:/msys64/mingw64/bin/ruby C:/msys64/mingw64/bin/jekyll
PYIMG ?= python
web:
	$(PYIMG) tools/paginas_web.py docs
	python3 tools/jekyll.py docs
	python3 tools/make_web.py docs/imagenes docs/index.html en
	python3 tools/make_web.py docs/imagenes docs/es/index.html es
	rm -rf $(WORK)/_site
	$(JEKYLL) build -s docs -d $(WORK)/_site
	python3 tools/check_enlaces.py $(WORK)/_site

test:
	@echo "=================================================================="
	@echo " Tests"
	@echo "=================================================================="
	@python3 -m unittest discover -s tests -v

clean:
	rm -rf $(WORK)/msx1 $(WORK)/msx2 $(WORK)/comun

.PHONY: all comprueba reconoce paginas semillas semillas-traza trace listado \
        verify sanity densidad test web clean
