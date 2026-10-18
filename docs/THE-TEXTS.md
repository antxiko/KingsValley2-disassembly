# The texts

Every text in the cartridge, taken from the ROM (`tools/textos.py`). They are the same on both cartridges. There are two fonts: the one for the menus and the game (`0xE1` = A) and the one for the sequences and the ending (`0xDD` = A).

Two typos in the original: TURN OFF THE **SWICH** (the ending) and TOO **MANNY** FILES (a disk error nobody asks for).

The credits: PROGRAM I.AKADA, K.NAGAE, T.OKA, T.OTSUKA · GRAPHIC H.MAKITANI, M.TABATA, S.UENO, S.IWAMOTO · SOUND K.UEHARA, M.IKARIKO, Y.MANNO, T.FURUKAWA, K.YAMASHITA · TITLE DESIGN N.SATO · GAME DESIGN S.IWAMOTO · SPECIAL THANKS HAL, IKU, SALT, TERA, ROOM 1008, ROOM 1013, RC727.

## The whole list

**`p13:BC54`** (the menus)

    FLOOR1
    FLOOR2
    LADDER
    PLAYER
    ENEMY
    TRAP
    TOOL WEAPON
    SOUL STONE
    EXIT DOOR
    SAVE
    END

**`p13:BCC2`** (the editor submenus)

    SLOUMAN
    FLOUMAN
    PYONCY
    ROCK ROLL

**`p13:BCEC`** (the editor submenus)

    DOOR1 LR
    DOOR1 RL
    DOOR2 LR
    DOOR2 RL
    WALL
    FLOOR
    STONE
    LADDER

**`p13:BD39`** (the editor submenus)

    KNIFE
    BOOMERANG
    SCOOP
    PICK
    HAMMER
    DRILL

**`p13:BD6D`** (the menus)

    LOAD DATA ?
    YES
    NO

**`p13:BD86`** (the menus)

    - FILE NAME -
    NEXT --  M KEY
    LOAD -- RET KEY

**`p13:BDB9`** (the menus)

    - LOAD MODE -
    TAPE LOAD

**`p13:BDE9`** (the menus)

    INPUT FILE NAME
    ________

**`p13:BE06`** (the menus)

    NOW LOADING

**`p13:BE14`** (the menus)

    - SAVE MODE -
    TAPE SAVE

**`p13:BE44`** (the menus)

    FILE1

**`p13:BE4C`** (the menus)

    FILE2

**`p13:BE54`** (the menus)

    FILE3

**`p13:BE5C`** (the menus)

    FILE SELECT

**`p13:BE6A`** (the menus)

    SAVE ERROR

**`p13:BE77`** (the menus)

    EDIT END
    OK ?  Y OR N

**`p13:BE91`** (the menus)

    INPUT PASSWORD
    ________

**`p13:BEAD`** (the menus)

    WRONG PASSWORD

**`p13:BEBE`** (the menus)

    RIGHT PASSWORD

**`p12:AC01`** (entering the pyramid, with the password)

    DO YOUR BEST !!

**`p12:AC1D`** (each cleared pyramid (1 to 5: the 6th goes to the ending))

    HOLD OUT!!

**`p12:AC2A`** (each cleared pyramid (1 to 5: the 6th goes to the ending))

    TRY TO TAKE
    A NEW STEP
    FORWARD

**`p12:AC4F`** (each cleared pyramid (1 to 5: the 6th goes to the ending))

    HEAVEN KNOWS
    WHEN
    THIS GAME
    WILL END

**`p12:AC7C`** (each cleared pyramid (1 to 5: the 6th goes to the ending))

    OH! MY GOD!
    I BELIEVE
    IN GOD

**`p12:AC9F`** (each cleared pyramid (1 to 5: the 6th goes to the ending))

    AT LONG LAST
    FINAL
    COUNT DOWN

**`p12:ACC3`** (the ending)

    CONGRATULATIONS
    TO VICK XIII !
    YOU HEROICALLY
    UNSEALED ALL THE
    LOCKS.

**`p12:AD12`** (the ending)

    ALL YOU HAVE TO DO NOW
    IS TURN OFF THE SWICH
    TO SAVE THE WORLD.

**`p12:AD58`** (the ending)

    PUSH SPACE KEY

**`p12:AD69`** (the ending)

    DANGER !!!

**`p12:AD88`** (the ending)

    THE END

**`p12:AD92`** (the ending)

    STAFF

**`p12:AD9A`** (the ending)

    PROGRAM
    I.AKADA
    K.NAGAE
    T.OKA
    T.OTSUKA

**`p12:ADCB`** (the ending)

    GRAPHIC
    H.MAKITANI
    M.TABATA
    S.UENO
    S.IWAMOTO

**`p12:AE02`** (the ending)

    SOUND
    K.UEHARA
    M.IKARIKO
    Y.MANNO
    T.FURUKAWA
    K.YAMASHITA

**`p12:AE46`** (the ending)

    TITLE DESIGN
    N.SATO

**`p12:AE5E`** (the ending)

    GAME DESIGN
    S.IWAMOTO

**`p12:AE78`** (the ending)

    SPECIAL THANKS
    HAL
    IKU
    SALT
    TERA
    ROOM  1008
    ROOM  1013
    RC727

**`p12:AEC5`** (the ending)

    PRESENTED BY
    KONAMI

**`p12:AEDD`** (the ending)

    THANKS TO YOUR COURAGE
    THE WORLD HAS BEEN SAVED !!
    WELL DONE.

**`p12:AF21`** (the ending)

    CONGRATULATIONS !!!

**`p12:AF60`** (disk error)

    DISK ERROR

**`p12:AF6D`** (the disk errors)

    DISK IO ERROR

**`p12:AF7D`** (no files)

    FILE NOT FOUND

**`p12:AF8E`** (the disk errors)

    DISK FULL

**`p12:AF9A`** (the disk errors)

    DISK NOT READY

**`p12:AFAB`** (the disk errors)

    WRITE PROTECT

**`p12:AFBB`** (the disk errors)

    TOO MANNY FILES

**`p12:AFCD`** (the disk errors)

    DATATYPEERROR

**`p12:B185`** (the start menu)

    START  SELECT
    NORMAL
    PASSWORD
    STAGE LOAD

**`p12:B256`** (the stage)

    NICE !
    LETS GO NEXT STAGE
    SPECIAL BONUS

**`p12:B284`** (the menu)

    SECRET COMMAND
    F??T???L
    ??Y?????

**`p12:B585`** (the sound select)

    SOUND SELECT
    SELECT --- SPACE
    END --- RETURN

**`p12:B5B8`** (the puzzle)

    PUZZLE  GAME

**`p12:B5C7`** (the puzzle solved)

    ALL RIGHT
    REST  3 UP

**`p12:B8AF`** (the puzzle)

    END  ESC KEY
    PUSH SPACE KEY

**`p12:BE67`** (the tape)

    SKIP

**`p12:BE6E`** (the tape)

    FIND

**`p12:BF0E`** (tape error)

    LOAD ERROR

**`p12:BF94`** (tape error)

    SAVE ERROR

**`p14:9D3B`** (hidden spot 1)

    MUSIC STAGE

**`p14:9D49`** (hidden spot 2)

    PUZZLE STAGE
