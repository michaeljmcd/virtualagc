### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:    EXTENDED_VERBS.agc
## Purpose:     A section of a reconstructed, mixed version of Sundance
##              It is part of the reconstructed source code for the Lunar
##              Module's (LM) Apollo Guidance Computer (AGC) for Apollo 9.
##              No original listings of this program are available;
##              instead, this file was created via disassembly of dumps
##              of various revisions of Sundance core rope modules.
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2020-06-17 MAS  Created from Luminary 69.


                BANK    7
                SETLOC          EXTVERBS
                BANK

                EBANK=          OGC

                COUNT*          $$/EXTVB
# FAN-OUT

GOEXTVB         INDEX           MPAC                    # VERB-40 IS IN MPAC
                TC              LST2FAN                 # FAN AS BEFORE.

LST2FAN         TC              VBZERO                  # VB40 ZERO (USED WITH NOUN 20 OR 72 ONLY)
                TC              VBCOARK                 # VB41 COARSE ALIGN (USED WITH NOUN 20 OR
                                                        #                                 72 ONLY)
                TC              IMUFINEK                # VB42 FINE ALIGN IMU
                TC              IMUATTCK                # VB43  LOAD IMU ATTITUDE ERROR METERS.
                TC              RRDESEND                # VB44 TERMINATE CONTINUOUS DESIGNATE
                TC              V45                     # VB45 W MATRIX MONITOR
                TC              ALM/END                 # VB46 SPARE
                TC              V47TXACT                # VB47 AGS INITIALIZATION
                TC              DAPDISP                 # VB48  LOAD A/P DATA
                TCF             CREWMANU                # VB49 START AUTOMATIC ATTITUDE MANEUVER
                TC              GOLOADLV                # VB50 PLEASE PERFORM
                TC              ALM/END                 # VB51 SPARE
                TC              GOLOADLV                # VB52 PLEASE MARK X - RETICLE.
                TC              GOLOADLV                # VB53 PLEASE MARK Y - RETICLE.
                TC              GOLOADLV                # VB54 PLEASE MARK X OR Y - RETICLE
                TC              ALINTIME                # VB55 ALIGN TIME
                TC              TRMTRACK                # VB56 TERMINATE TRACKING - P20 + P25
                TC              ALM/END                 # VB57 SPARE
                TC              ALM/END                 # VB58 SPARE
                TC              ALM/END                 # VB59 SPARE
                TC              DAPATTER                # VB60 DISPLAY DAP ATTITUDE ERROR
                TC              LRPOS2K                 # VB61 COMMAND LR TO POSITION 2.
                TC              R04                     # VB62 SAMPLE RADAR ONCE PER SECOND
                TC              TOTATTER                # VB63 DISPLAY TOTAL ATTITUDE ERROR
                TC              ALM/END                 # VB64 SPARE
                TC              SNUFFOUT                # VB65 DISABLE U,V JETS DURING DPS BURNS.
                TC              ATTACHED                # VB66 ATTACHED   MOVE THIS TO OTHER STATE
                TC              ALM/END                 # VB67 SPARE
                TC              ALM/END                 # VB68 SPARE
VERB69          TC              VERB69                  # VB69 FORCE A HARDWARE RESTART
                TC              V70UPDAT                # VB70 UPDATE LIFTOFF TIME.
                TC              V71UPDAT                # VB71 UNIVERSAL UPDATE - BLOCK ADDRESS.
                TC              V72UPDAT                # VB72 UNIVERSAL UPDATE - SINGLE ADDRESS.
                TC              V73UPDAT                # VB73 UPDATE AGC TIME (OCTAL).
                TC              DNEDUMP                 # VB74 INITIALIZE DOWN-TELEMETRY PROGRAM
                                                        #        FOR ERASABLE DUMP.
                TC              OUTSNUFF                # VB75 ENABLE U,V JETS DURING DPS BURNS.

                TC              MINIMP                  # VB76 MINIMUM IMPULSE MODE
                TC              NOMINIMP                # VB77 RATE COMMAND MODE
                TC              R77                     # VB78 START LR SPURIOUS RETURN TEST
                TC              R77END                  # VB79 TERMINATE LR SPURIOUS RETURN TEST
                TC              LEMVEC                  # VB80 UPDATE LEM STATE VECTOR
                TC              CSMVEC                  # VB81 UPDATE CSM STATE VECTOR
                TC              V82PERF                 # VB82 REQUEST ORBIT PARAM DISPLAY (R30)
                TC              V83PERF                 # VB83 REQUEST REND PARAM DISPLAY (R31)
                TC              R32                     # VB84 START TARGET DELTA V (R32)
                TC              ALM/END                 # VB85 SPARE
                TC              ALM/END                 # VB86 SPARE
                TC              ALM/END                 # VB87 SPARE
                TC              ALM/END                 # VB88 SPARE
                TC              V89PERF                 # VB89 ALIGN XORZ LEM AXIS ALONG LOS (R63)
                TC              V90PERF                 # VB90 OUT OF PLANE RENDEZVOUS DISPLAY
                TC              GOSHOSUM                # VB91 DISPLAY BANK SUM.
                TC              SYSTEST                 # VB92 OPERATE IMU PERFORMANCE TEST.
                TC              WMATRXNG                # VB93 CLEAR RENDWFLG
                TC              ALM/END                 # VB94 SPARE
                TC              UPDATOFF                # VB95 NO STATE VECTOR UPDATE ALLOWED
                TC              VERB96                  # VB96 INTERRUPT INTEGRATION AND GO TO POO
                TC              ALM/END                 # VB97 SPARE
                TC              ALM/END                 # VB98 SPARE
                TC              GOLOADLV                # VB99 PLEASE ENABLE ENGINE

# END OF EXTENDED VERB FAN

TESTXACT        CCS             EXTVBACT                # ARE EXTENDED VERBS BUSY
                TC              ALM/END                 # YES, TURN ON OPERATOR LIGHT
                CA              FLAGWRD4                # ARE PRIORITY DISPLAYS USING DSKY
                MASK            OC24100
                CCS             A
                TC              ALM/END                 # YES
                CAF             OCT24                   # SET BITS 3 AND 5
SETXTACT        TS              EXTVBACT                # NO. SET FLAG TO SHOW EXT VERB DISPLAY
                                                        # SYSTEM BUSY

                CA              Q
                TS              MPAC            +1

                CS              TWO                     # BLANK EVERYTHING EXCEPT MM AND VERB
                TC              NVSUB
                TC              +1
                TC              MPAC            +1

XACTALM         TC              FALTON                  # TURN ON OPERATOR ERROR LIGHT.
                TC              ENDEXT                  # RELEASE MARK AND EXT. VERB DISPLAY SYS.

TERMEXTV        EQUALS          ENDEXT

ENDEXTVB        EQUALS          ENDEXT

XACT0           CAF             ZERO                    # RELEASE MARK AND EXT. VERB DISPLAY SYS.
                TC              SETXTACT

ALM/END         TC              FALTON                  # TURN ON OPERATOR ERROR LIGHT
GOPIN           TC              POSTJUMP
                CADR            PINBRNCH

CHKPOOH         CA              MODREG                  # CHECK FOR POO OR POO-.
                EXTEND
                BZF             TCQ
                TC              ALM/END

OC24100         OCT             24100

#          VBZERO       VERB 40            DESCRIPTION
#
#              1. REQUIRE NOUN 20 (ICDU ANGLES) OR NOUN 72 (RCDU ANGLES).
#             2. FOR N20, CHECK IMUCADR IN AN EFFORT TO AVOID A 1210 RESTART.
#                FOR N72, CHECK IF EITHER RADAR IS IN USE.
#              3. EXECUTE THE CDU ZERO.
#              4. STALL UNTILL THE ZERO IS DONE.
#              5. DON'T DIFFERENIATE BETWEEN A BAD OR GOOD RETURN.
#              6. EXIT, RE-ESTABLISHING THE INTERRUPTED DISPLAY (IF ANY).

VBZERO          TC              OP/INERT
                TC              IMUZEROK                # RETURN HERE IF NOUN = ICDU(20)
                TC              RRZEROK                 # RETURN HERE IF NOUN = RCDU(72)
IMUZEROK        TC              CKMODCAD
                TC              BANKCALL                # KEYBOARD REQ FOR ISS CDUZERO
                CADR            IMUZERO

                TC              BANKCALL                # STALL
                CADR            IMUSTALL
                TC              +1

                TC              GOPIN                   # IMUZERO

RRZEROK         CA              RADCADR
                TC              CKMODCAD +1
                TC              BANKCALL
                CADR            RRZERO

RWAITK          TC              BANKCALL
                CADR            RADSTALL
                TCF             +1
                TC              GOPIN                   # RRZERO

#          LRPOS2K     VERB 60             DESCRIPTION
#              COMMAND LANDING RADAR TO POSITION 2
#             1. EXIT WITH OP ERROR IF SOMEONE IS USING EITHER RADAR.
#              2. ALARM WITH CODE 523 IF POS 2 IS NOT INDICATED WITHIN
#                 THE PRESCRIBED TIME.
#              3. RE-ESTABLISH THE DISPLAYS.

LRPOS2K         CA              RADCADR
                TC              CKMODCAD +1
                TC              BANKCALL                # COMMAND LR TO POSITION 2
                CADR            LRPOS2
                TCF             RWAITK

#          VBCOARK      VERB 41            DESCRIPTION
#              COARSE ALIGN IMU OR RADAR
#             1. REQUIRE NOUN 20 OR NOUN 72 OR TURN ON OPERATOR ERROR.
#              2. REQUIRE EXT VERB DISPLAY SYS AVAILABLE OR TURN ON OPERATOR ERROR LIGHT AND GO TO PINBRNCH.
#              CASE 1     NOUN 20     (ICDU ANGLES)
#              3. SET EXT VERB DISPLAY ACTIVE FLAG.
#              4. DISPLAY FLASHING V25,N22 (LOAD NEW ICDU ANGLES).
#                 RESPONSES
#                   A. TERMINATE
#                      1. RELEASE EXT VERB DISPLAY SYSTEM
#                   B. PROCEED
#                     1. COARSE ALIGN TO THE EXISTING THETAD'S (ICORK2).
#                   C. ENTER
#                     1. COARSE ALIGN TO THE LOADED THETAD'S (ICORK2).
#              ICORK2
#                 1. RE-DISPLAY VERB 41.
#                 2. EXECUTE IMUCOARS (IMU COARSE ALIGN).
#                 3. EXECUTE IMUSTALL (ALLOW TIME FOR DATA TRANSFER).
#                 4. RELEASE EXT VERB DISPLAY SYSTEM.
#              CASE 2     NOUN 72     (RCDU ANGLES)
#                EXIT WITH OP ERROR IF SOMEONE IS USING EITHER RADAD.
#              5. DISPLAY FLASHING V24,N73 (LOAD NEW RR TRUNION ANGLE AND NEW SHAFT ANGLE).
#                 RESPONSES
#                 A. TERMINATE
#                    1. RELEASE EXT VERB DISPLAY SYS.
#                 B. PROCEED OR ENTER
#                    1. EXECUTE AURLOKON (ASK OPERATOR FOR LOCK-ON REQUIREMENTS).
#                    2. RE-DISPLAY VERB 41.
#                    3. SCHEDULE RRDESK2 WITH PRIORITY 20.
#                    4. RELEASE EXT VERB DISPLAY SYS.

#                 AURLOKON

#                1. FLASH V04 N12 R1 = 00006 R2 = 00002
#                    RESPONSES
#                    A. TERMINATE
#                    B. PROCEED
#                      1. RESET LOCK-ON SWITCH
#                      2. SET CONTINUOUS DESIGNATE FLAG
#                      3. DISABLE R25
#                   C. V22 E 1 E, R1 = 00001, PROCEED
#                      1. SET LOCK-ON SWITCH
VBCOARK         TC              OP/INERT
                TC              IMUCOARK                # RETURN HERE IF NOUN = ICDU (20)
                TC              RRDESNBK                # RETURN HERE IF NOUN = RCDU (72)
#          RETURNS TO L+1 IF IMU OR L+2 IF RR.

OP/INERT        CS              OCT24
                AD              NOUNREG
                EXTEND
                BZF             TCQ                     # IF = 20.

                INCR            Q
                AD              RRIMUDIF                # -52
                EXTEND
                BZF             TCQ

                TC              ALM/END                 # ILLEGAL.

RRIMUDIF        DEC             -52                     # THE IMU
IMUCOARK        TC              CKMODCAD
                TC              TESTXACT                # COARSE ALIGN FROM KEYBOARD.
                CAF             VNLODCDU                # CALL FOR THETAD LOAD
                TC              BANKCALL
                CADR            GOXDSPF
                TC              TERMEXTV
                TCF             +1

ICORK2          CAF             IMUCOARV                # RE-DISPLAY COARSE ALIGN VERB.
                TC              BANKCALL
                CADR            EXDSPRET

                TC              BANKCALL                # CALL MODE SWITCHING PROG
                CADR            IMUCOARS

                TC              BANKCALL                # STALL
                CADR            IMUSTALL
                TC              ENDEXTVB
                TC              ENDEXTVB

VNLODCDU        VN              2522
IMUCOARV        VN              4100

#          DESIGNATE TO DESIRED GIMBAL ANGLES.

RRDESNBK        CA              RADCADR
                TC              CKMODCAD +1
                TC              TESTXACT
                CA              RNDVZBIT                # IS P20 RUNNING?
                MASK            FLAGWRD0
                CCS             A
                TCF             XACTALM                 # OPERATOR ERROR IF IN P20
                CS              OCT41000                # TERMINATE PRESENT DESIGNATION
                MASK            RADMODES
                TS              RADMODES

                CAF             VNLDRCDU                # ASK FOR GIMBAL ANGLES.
                TC              BANKCALL
                CADR            GOXDSPF
                TC              TERMEXTV
                TCF             -4                      # V33

                TC              BANKCALL                # ASK OP FOR LOCK ON REQUIREMENTS.
                CADR            AURLOKON

                CAF             OPTCOARV                # RE-DISPLAY OUR OWN VERB
                TC              BANKCALL
                CADR            EXDSPRET

                CAF             PRIO20
                TC              FINDVAC
                EBANK=          LOSCOUNT
                2CADR           RRDESK2

                TCF             TERMEXTV                # FREES DISPLAY.

VNLDRCDU        VN              2473
OPTCOARV        EQUALS          IMUCOARV                # DIFFERENT NOUNS.

RRDESK2         TC              BANKCALL
                CADR            RRDESNB

                TC              +1                      # DUMMY NEEDED SINCE DESRETRN DOES INCR
                TC              BANKCALL                # WAIT FOR COMPLETION OF DESIGNATE
                CADR            RADSTALL

                TC              +2                      # BADEND-NO LOCKON OR OUT OF LIMITS
                TC              ENDOFJOB                # GOODEND-LOCKON ACHIEVED
                TC              ALARM
                OCT             503                     # TURN ON ALARM LIGHT -503 DESIGNATE FAIL
                TC              ENDOFJOB

RRDESEND        CCS             RADMODES                # TERMINATE CONTINUOUS DESIGNATE ONLY
                TCF             GOPIN
                TCF             GOPIN
                TCF             +1
                CS              OCT41000                # BEGDES GOES TO ENDRADAR
                INHINT                                  # RELINT DONE IN DOWNFLAG
                MASK            RADMODES
                TS              RADMODES
                TC              BANKCALL
                CADR            CLRADMOD
                CAF             1SEC
                TC              BANKCALL
                CADR            DELAYJOB
                TC              DOWNFLAG                # ENABLE R25 GIMBAL MONITOR
                ADRES           NORRMON
                TCF             GOPIN
OCT41000        OCT             41000                   # CONTINUOUS DESIGNATE - DESIGNATE

                BANK            23
                SETLOC          EXTVB1
                BANK
                COUNT*          $$/EXTVB

AURLOKON        TC              MAKECADR
                TS              DESRET
                CAF             TWO
                TS              OPTION1         +1
                CAF             SIX                     # OPTION CODE FOR V04N12
                TS              OPTION1

    -5          CAF             V04N0672
                TC              BANKCALL                #      R2   00001  LOCK-ON
                CADR            GOMARKFR
                TCF             ENDEXT                  # V34
                TCF             +5                      # V33
                TCF             -5                      # V32
                CAF             BIT3
                TC              BLANKET
                TC              ENDOFJOB

    +5          CA              OPTION1         +1
                MASK            BIT2
                CCS             A
                TCF             +3                      # ON TERM.
                CAF             LOKONBIT
                TCF             +2
                CAF             ZERO
                INHINT
                XCH             STATE
                MASK            -LOKONFG
                ADS             STATE
                
                MASK            LOKONBIT                # IF NO LOCK-ON CALLED FOR, SET BIT15 OF
                CCS             A                       # RADMODES TO INDICATE THAT ARBITRARILY-
                TCF             +5                      # LONG DESIGNATION IS WANTED (TO BE
                
                CAF             BIT15                   # TERMINATED BY FRESH START).
                ADS             RADMODES
                TC              UPFLAG
                ADRES           NORRMON
                RELINT
                CA              DESRET
                TCF             BANKJUMP        

-LOKONFG        OCT             -20
V04N0672        VN              406

                BANK            43
                SETLOC          EXTVERBS
                BANK
                COUNT*          $$/EXTVB


                EBANK=          OGC

#          IMUFINEK     VERB 42            DESCRIPTION
#              FINE ALIGN IMU
#              1. REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG OR TURN ON OPER ERROR AND GO TO PINBRNCH.
#              2. DISPLAY FLASHING V25,N93....LOAD DELTA GYRO ANGLES....
#                 RESPONSES
#                 A. TERMINATE
#                    1. RELEASE EXT VERB DISPLAY SYSTEM.
#                 B. PROCEED OR ENTER
#                    1. RE-DISPLAY VERB 42
#                    2. EXECUTE IMUFINE (IMU FIVE ALIGN MODE SWITCHING).
#                    3. EXECUTE IMUSTALL (ALLOW FOR DATA TRANSFER)
#                       A. FAILED
#                          1. RELEASE EXT VERB DISPLAY SYSTEM.
#                       B. GOOD
#                          1. EXECUTE IMUPULSE (TORQUE IRIGS).
#                          2. EXECUTE IMUSTALL AND RELEASE EXT VERB DISPLAY SYSTEM.

IMUFINEK        TC              CKMODCAD
                TC              TESTXACT                # FINE ALIGN WITH GYRO TORQUING.
                CAF             VNLODGYR                # CALL FOR LOAD OF GYRO COMMANDS
                TC              BANKCALL
                CADR            GOXDSPF
                TC              TERMEXTV
                TC              +1                      # PROCEED WITHOUT A LOAD

                CAF             IMUFINEV                # RE-DISPLAY OUR OWN VERB
                TC              BANKCALL
                CADR            EXDSPRET

                TC              BANKCALL                # CALL MODE SWITCH PROG
                CADR            IMUFINE

                TC              BANKCALL                # HIBERNATION
                CADR            IMUSTALL
                TC              ENDEXTVB

FINEK2          CAF             LGYROBIN                # PINBALL LEFT COMMANDS IN OGC REGIST5RS
                TC              BANKCALL
                CADR            IMUPULSE

                TC              BANKCALL                # WAIT FOR PULSES TO GET OUT.
                CADR            IMUSTALL
                TC              ENDEXTVB
                TC              ENDEXTVB

LGYROBIN        ECADR           OGC
VNLODGYR        VN              2593
IMUFINEV        VN              4200
#          GOLOADLV     VERB 50            DESCRIPTION
#                       AND OTHER PLEASE

#                       DO SOMETHING VERBS
#              PLEASE PERFORM, MARK, CALIBRATE, ETC.
#              1. PRESSING ENTER ON DSKY INDICATES REQUESTED ACTION HAS BEEN  PERFORMED, AND THE PROGRAM DOES THE
#                 SAME RECALL AS A COMPLETED LOAD.
#              2. THE EXECUTION OF A VERB 33 (PROCEED WITHOUT DATA) INDICATES THE REQUESTED ACTION IS NOT DESIRED.

                SBANK=          PINSUPER                # FOR LOADLV1 AND SHOWSUM CADR'S.

GOLOADLV        TC              FLASHOFF

                CAF             PINSUPBT
                EXTEND
                WRITE           SUPERBNK
                TC              POSTJUMP
                CADR            LOADLV1

# VERB 47 - AGS INITIALIZATION - R47.
#
#          SEE LOG SECTION AGS INITIALIZATION FOR OTHER PERTINENT REMARKS.

V47TXACT        TC              TESTXACT        # NO OTHER EXTVERB.
                CAF             PRIO4
                TC              FINDVAC
                EBANK=          AGSBUFF
                2CADR           AGSINIT

                TC              ENDOFJOB

CKMODCAD        CA              MODECADR
                EXTEND
                BZF             TCQ
                TC              ALM/END         # SOMEBODY IS USING MODECADR SO EXIT

#          ALINTIME     VERB 55            DESCRIPTION
#                 REQUIRE POO OR POO-.
#              1. SET EXT VERB DISPLAY BUSY FLAG.
#              2. DISPLAY FLASHING V25,N24 (LOAD DELTA TIME FOR AGC CLOCK.
#              3. REQUIRE EXECUTION OF VERB 23.
#              4. ADD DELTA TIME, RECEIVED FROM INPUT REGISTER, TO THE COMPUTER TIME.
#              5. RELEASE EXT VERB DISPLAY SYSTEM

ALINTIME        TC              TESTXACT
                CAF             VNLODDT
                TC              BANKCALL
                CADR            GOXDSPF
                TC              ENDEXT                  # TERMINATE
                TC              ENDEXT                  # PROCEED
                CS              DEC23                   # DATA IN OR RESEQUENCE(UNLIKELY)
                AD              MPAC                    # RECALL LEFT VERB IN MPAC
                EXTEND
                BZF             UPDATIME                # GO AHEAD WITH UPDATE ONLY IF RECALL
                TC              ENDEXT                  #   WITH V23 (DATA IN).

UPDATIME        INHINT                                  # DELTA TIME IS IN DSPTEM1, +1.
                CAF             ZERO
                TS              MPAC            +2      # NEEDED FOR TP AGREE
                TS              L                       # ZERO T1 + 2 WHILE ALIGNING.
                DXCH            TIME2
                DXCH            MPAC
                DXCH            DSPTEM2         +1      # INCREMENT
                DAS             MPAC

                TC              TPAGREE                 # FORCE SIGN AGREEMENT.
                DXCH            MPAC                    # NEW CLOCK.
                DAS             TIME2
                RELINT
UPDTMEND        TC              ENDEXT

DEC23           DEC             23                      # V 23

VNLODDT         VN              2524                    # V25N24 FOR LOAD DELTA TIME

# SET UP FOR RADAR SAMPLING.

                BANK            42
                SETLOC          EXTVERBS
                BANK

                EBANK=          RSTACK

                COUNT*          $$/R0477

R77             TC              TESTXACT
                TC              DOWNFLAG
                ADRES           R04FLAG
                TC              UPFLAG
                ADRES           R77FLAG
                TCF             R04Z

R04             CAF             RNDVZBIT
                MASK            FLAGWRD0
                CCS             A
                TC              ALM/END
                TC              TESTXACT
                TC              UPFLAG
                ADRES           R04FLAG                 # SET R04FLAG FOR ALARMS

R04Z            CAF             EBANK4
                TS              EBANK
                CAF             1SEC+1                  # SAMPLE ONCE PER SECOND
                TS              RSAMPDT
                CAF             ZERO
                TS              RTSTLOC
                TS              RFAILCNT                # ZERO BAD SAMPLE COUNTER

                INHINT
                CS              LRPOSCAL                # INITIALIZE
                MASK            RADMODES                #     BIT 9   LR RANGE  LOW SCALE =0
                TS              RADMODES                #     BIT 6   LR POS 1 =0
                CAF             LRPOSCAL                #     BIT 3   RR RANGE  LOW SCALE =0
                EXTEND
                RAND            CHAN33
                ADS             RADMODES
                RELINT

                CS              FLAGWRD3                # CHECK R04FLAG       R04 =1    R77 =0
                MASK            R04FLBIT
                CCS             A
                TCF             R04K

                CAF             ONE                     # INDICATES RENDEZVOUS DESIRED
                TS              OPTION1         +1
R04A            CAF             BIT3                    # OPTION CODE FOR V04N12

                TS              OPTION1
                CAF             V04N06X
                TC              BANKCALL                #       R2   00001  RENDEZVOUS RADAR
                CADR            GOMARKFR                #            00002  LANDING RADAR
                TCF             R04END                  # V34
                TCF             +5                      # V33
                TCF             R04A            +2      # R2
                CAF             BIT3
                TC              BLANKET
                TC              ENDOFJOB

                CA              OPTION1         +1      # SAVE DESIRED OPTION       RR =1      LR =2
                TS              RTSTDEX

R04X            CAF             SIX                     # RR OR LR DESIRED
                MASK            RTSTDEX
                CCS             A
                TCF             R04L                    # LANDING RADAR
                TS              RTSTBASE                # FOR RR   BASE = 0, MAX = 1

R04B            CAF             BIT2                    # IS RR AUTO MODE DISCRETE PRESENT
                EXTEND
                RAND            CHAN33
                EXTEND
                BZF             R04C                    # YES

                CAF             201R04                  # REQUEST SELECTION OF RR AUTO MODE
                TS              DSPTEM1
                CAF             V50N25X
                TC              BANKCALL
                CADR            GOMARK4
                TCF             R04END                  # V34
                TCF             R04B                    # V33
                TCF             -7                      # E

R04C            CAF             BIT14                   # ENABLE RR AUTO TRACKER
                EXTEND
                WOR             CHAN12

                CAF             TWO
                TS              RTSTMAX                 # FOR SEQUENTIAL STORAGE

                TC              WAITLIST
                EBANK=          RSTACK
                2CADR           RADSAMP

                RELINT

                CS              FLAGWRD3                # CHECK R04FLAG      R04 =1    R77 =0
                MASK            R04FLBIT

                CCS             A
                TCF             GOPIN                   # R77

                CAF             SIX                     # RR OR LR
                MASK            RTSTDEX
                CCS             A
                TCF             R04LR                   # LR

R04RR           CAF             V16N72                  # DISPLAY RR CDU ANGLES (1/SEC)
                TC              BANKCALL                #          R1  +  XXX.XX DEG   TRUNNION
                CADR            GOMARKF                 #          R2  +  XXX.XX DEG   SHAFT
                TCF             R04END                  # V34      R3     BLANK
                TCF             +2                      # V33
                TCF             R04RR                   # V32

                CAF             V16N78                  # DISPLAY RR RANGE AND RANGE RATE (1/SEC)
                TC              BANKCALL                #          R1  +- XXX.XX NM    RANGE
                CADR            GOMARKF                 #          R2  +- XXXXX. FPS   RANGE RATE
                TCF             R04END                  # V34      R3     BLANK
                TCF             R04Y                    # V33
                TCF             R04RR                   # V32

R04LR           CAF             V16N66                  # DISPLAY LR RANGE AND POSITION (1/SEC)
                TC              BANKCALL                #          R1  +- XXXXX. FT    LR RANGE
                CADR            GOMARKF                 #          R2  +  0000X.       POS. NO.
                TCF             R04END                  # V34      R3     BLANK
                TCF             +2                      # V33
                TCF             R04LR                   # V32

                CAF             V16N67                  # DISPLAY LR VELX, VELY, VELZ (1/SEC)
                TC              BANKCALL                #          R1  +- XXXXX. FPS   LR V(X)
                CADR            GOMARKF                 #          R2  +- XXXXX. FPS   LR V(Y)
                TCF             R04END                  # V34      R3  +- XXXXX. FPS   LR V(Z)
                TCF             R04Y                    # V33
                TCF             R04LR                   # V32

R04Y            CAF             ZERO                    # TO TERMINATE SAMPLING
                TS              RSAMPDT
                CAF             2SECS                   # WAIT FOR LAST RADARUPT
                TC              BANKCALL
                CADR            DELAYJOB
                CAF             1SEC+1                  # SAMPLE ONCE PER SECOND
                TS              RSAMPDT
                CAF             ZERO                    # FOR STORING RESULTS
                TS              RTSTLOC
                CAF             SIX
                MASK            RTSTDEX
                CCS             A
                CS              ONE                     # WAS LR
                AD              TWO                     # WAS RR


                TCF             R04X            -1

R04K            CAF             250MS+1                 # SAMPLE 4 LR COMPONENTS PER SECOND.
                TS              RSAMPDT

R04L            CAF             TWO
                TS              RTSTBASE                # FOR LR   BASE = 2, MAX = 3
                CAF             SIX
                TCF             R04C            +4
R04END          CAF             ZERO                    # ZERO RSAMPDT
                TS              RSAMPDT                 # TO TERMINATE SAMPLING
                CAF             BIT8                    # WAIT 1.28 SECONDS FOR POSSIBLE
                TC              BANKCALL                # PENDING RUPT.
                CADR            DELAYJOB

                INHINT
                CS              BIT14                   # DISABLE RR AUTO TRACKER
                EXTEND
                WAND            CHAN12

                TC              DOWNFLAG
                ADRES           R04FLAG                 # SIGNAL END OF R04.

                TC              ENDEXT

R77END          CAF             EBANK4                  # TO TERMINATE SAMPLING
                TS              EBANK
                CAF             ZERO
                TS              RSAMPDT
                CAF             BIT6                    # WAIT 320 MS FOR POSSIBLE
                TC              BANKCALL                # PENDING RUPT.
                CADR            DELAYJOB

                TC              DOWNFLAG
                ADRES           R77FLAG
                TCF             ENDEXT

V16N72          VN              1672
V16N78          VN              1678
V16N66          VN              1666
V16N67          VN              1667
V04N06X         VN              406
V50N25X         VN              5025
201R04          OCT             00201
1SEC+1          DEC             101
250MS+1         DEC             26
LRPOSCAL        OCT             444

                COUNT*          $$/EXTVB

#          IMUATTCK      VERB 43           DESCRIPTION
#              LOAD IMU ATTITUDE ERROR METERS
#                 1. REQUIRE POO OR FRESH START.
#                 2. REQUIRE COARSE ALIGN ENABLE AND ZERO ICDU BITS OFF.
#                 3. REQUIRE THAT NEEDLES BE OFF.
#                 4. REQUEST LOAD OF N22  (VAUES TO BE DISPLAYED).
#                 5. ON PROCEED OR ENTER RE-DISPLAY V43 AND SEND PULSES.

IMUATTCK        TC              CHKPOOH                 # VB 76 - LOAD IMU ATT. ERROR METERS

                CAF             SBITS4&5                # SEE IF COARSE ALIGN ENABLE AND ZERO IMU
                EXTEND                                  # CDUS BITS ARE ON
                RAND            CHAN12
                CCS             A
                TCF             ALM/END                 # NOT ALLOWED IF IMU COARSE OR IMU ZERO ON

                CAF             BIT13-14                # BOTH BITS 13 AND 14 MUST BE 1
                EXTEND                                  # INDICATING THE MODE SELECTED IS OFF.
                RXOR            CHAN31
                MASK            BIT13-14
                EXTEND
                BZF             +2                      # NEEDLES IS OFF.
                TCF             ALM/END                 # EXIT.  NEEDLES IS ON.

                TC              TESTXACT

                CAF             VNLODCDU
                TC              BANKCALL
                CADR            GOXDSPF
                TC              ENDEXT                  # V34
                TC              +1
                CAF             V43K                    # REDISPLAY OUR VERB.
                TC              BANKCALL
                CADR            EXDSPRET
                CAF             BIT6
                EXTEND
                WOR             CHAN12                  # ENABLE ERROR COUNTERS.
                CAF             TWO
                TC              WAITLIST                # PUT OUT COMMANDS IN .32 SECONDS.
                EBANK=          THETAD
                2CADR           ATTCK2

                TCF             ENDEXT

                BANK            42
                SETLOC          PINBALL3                # SOMETHING IN B42.
                BANK

                COUNT*          $$/EXTVB

ATTCK2          CAF             TWO                     # PUT OUT COMMANDS.
 +1             TS              Q                       # CDU WILL LIMIT EXCESS DATA.
                INDEX           A
                CA              THETAD
                EXTEND
                MP              ATTSCALE
                INDEX           Q
                XCH             CDUXCMD
                CCS             Q
                TCF             ATTCK2          +1

                CAF             13,14,15
                EXTEND
                WOR             CHAN14
                TCF             TASKOVER                # LEAVE ERROR COUNTERS ENABLED.

ATTSCALE        =               BIT13

                BANK            7
                SETLOC          EXTVERBS
                BANK

                COUNT*          $$/EXTVB

V43K            VN              4300
SBITS4&5        OCT             30
#          V82PERF     VERB 82             DESCRIPTION
#              REQUEST ORBIT PARAMETERS DISPLAY (R30)
# 1. IF AVERAGE G IS OFF:
#          FLASH DISPLAY V04N06. R2 INDICATES WHICH SHIP'S STATE VECTOR IS
#           TO BE UPDATED. INITIAL CHOICE IS THIS SHIP (R2=1). ASTRONAUT
#           CAN CHANGE TO OTHER SHIP BY V22EXE, WHERE X NOT EQ 1.
#          SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
#          CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
#           RPER (PERIGEE RADIUS), RAPO (APOGEE RADIUS), HPER (PERIGEE
#           HEIGHT ABOVE LAUNCH PAD OR LUNAR LANDING SITE), HAPO (APOGEE
#           HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO
#           INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
#          FLASH MONITOR V16N44 (HAPO, HPER, TFF).TFF IS -59M59S IF IT WAS
#           NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
#           ASTRONAUT HAS OPTION TO MONITOR TPER BY KEYING IN N 32 E.
#           DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
#           ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.

# 2. IF AVERAGE G IS ON:
#          CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
#           FOR THIS VEHICLE. V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
#           OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
#          FLASH MONITOR V16N44 (HAPO, HPER, TFF).
#          IF MODE IS P11, THEN CALL DELRSPL SO ASTRONAUT CAN MONITOR
#           RESULTS BY N50E. SPLASH COMPUTATION DONE ONCE PER TWO SECS.

V82PERF         TC              TESTXACT

                CAF             PRIO7                   # LESS THAN LAMBERT.  R30,V82
                TC              PRIOCHNG
                EXTEND
                DCA             V82CON
                TC              SUPDXCHZ                # V82CALL IN DIFF SUPERBANK FROM V82PERF

                EBANK=          HAPO
V82CON          2CADR           V82CALL


#          VB83PERF     VERB 83            DESCRIPTION
#              REQUEST RENDEZVOUS PARAMETER DISPLAY (R31)
#              1. SET EXT VERB DISPLAY BUSY FLAG.
#              2. SCHEDULE R31CALL WITH PRIORITY 5.
#                 A. DISPLAY
#                     R1  RANGE
#                     R2  RANGE RATE
#                     R3  THETA

V83PERF         TC              TESTXACT

                CAF             PRIO5
                TC              FINDVAC
                EBANK=          TSTRT
                2CADR           V83CALL

                TC              ENDOFJOB

# VERB 89 DESCRIPTION     RENDEZVOUS FINAL ATTITUDE ROUTINE (R63)

# CALLED BY VERB 89 ENTER DURING P00. PRIO 10 USED.  CALCULATES AND
# DISPLAYS FINAL FDAI BALL ANGLES TO POINT LM +X OR +Z AXIS AT CSM.

# 1. KEY IN V 89 E ONLY IF IN PROG 00. IF NOT IN P00, OPERATOR ERROR AND
# EXIT R63, OTHERWISE CONTINUE.

# 2. IF IN P00, DO IMU STATUS CHECK ROUTINE (R02BOTH). IF IMU ON AND ITS
# ORIENTATION KNOWN TO LGC, CONTINUE.

# 3. FLASH DISPLAY V 04 N 06.  R2 INDICATES WHICH SPACECRAFT AXIS IS TO
# BE POINTED AT CSM.  INITIAL CHOICE IS PREFERRED (+Z) AXIS (R2=1).
# ASTRONAUT CAN CHANGE TO (+X) AXIS (R2 NOT = 1) BY V 22 E 2 E.  CONTINUE
# AFTER KEYING IN PROCEED.

# 4. BOTH VEHICLE STATE VECTORS UPDATED BY CONIC EQS.

# 5. HALF MAGNITUDE UNIT LOS VECTOR (IN STABLE MEMBER COORDINATES) AND

# HALF MAGNITUDE UNIT SPACECRAFT AXIS VECTOR (IN BODY COORDINATES)
# PREPARED FOR VECPOINT.

# 6. GIMBAL ANGLES FROM VECPOINT TRANSFORMED INTO FDAI BALL ANGLES BY
# BALLANGS. FLASH DISPLAY V 06 N 18 AND AWAIT RESPONSE.

# 7. RECYCLE - RETURN TO STEP 4.
#    TERMINATE - EXIT R63.
#    PROCEED - RESET 3AXISFLG AND CALL R60LEM FOR ATTITUDE MANEUVER.


V89PERF         TC              CHKPOOH
                TC              TESTXACT
                CAF             PRIO10
                TC              FINDVAC
                EBANK=          RONE
                2CADR           V89CALL
                TC              ENDOFJOB

#          V90PERF     VERB 90             DESCRIPTION
#              REQUEST RENDEZVOUS OUT-OF-PLANE DISPLAY (R36)
#              1. SET EXT VERB DISPLAY BUSY FLAG.
#              2. SCHEDULE R36 CALL WITH PRIORITY 10
#                 A. DISPLAY
#                     TIME OF EVENT - HOURS , MINUTES , SECONDS
#                     Y  OUT-OF-PLANE POSITION - NAUTICAL MILES
#                     YDOT  OUT-OF-PLANE VELOCITY - FEET/SECOND
#                     PSI  ANGLE BTW LINE OF SIGHT AND FORWARD
#                          DIRECTION VECTOR IN HORIZONTAL PLANE - DEGREES

V90PERF         TC              TESTXACT
                CAF             PRIO7                   # R36,V90
                TC              FINDVAC
                EBANK=          RPASS36
                2CADR           R36
                TCF             ENDOFJOB
#          MINIMP     VERB 76              DESCRIPTION
#              MINIMUM IMPULSE MODE
#              1. SET MINIMUM IMPULSE RHC MODE FLAG TO 1.

MINIMP          INHINT
                CS              DAPBOOLS
                MASK            PULSES                  # PULSES = 1 INDICATES MIN IMP MODE
                ADS             DAPBOOLS
                TCF             GOPIN                   # RETURN VIA PINBRNCH

#          NOMINIMP     VERB 77            DESCRIPTION
#              RATE COMMAND MODE

#              1. SET MINIMUM IMPULSE RHC MODE FLAG TO 0. (ZERO INDICATES NOT MINIMUM IMPULSE MODE.).
#              2. MOVE CDUX,CDUY,CDUZ INTO CDUXD,CDUYD,CDUZD.

NOMINIMP        CAF             EBANK6
                TS              EBANK
                INHINT
                CS              PULSES
                MASK            DAPBOOLS
                TS              DAPBOOLS                # PULSES = 0 NOT IN MINIMUM UMPULSE MODE
                TC              IBNKCALL
                CADR            ZATTEROR
                TC              GOPIN

R32             TC              TESTXACT
                CAF             PRIO10
                TC              FINDVAC
                EBANK=          TIG
                2CADR           JOBR32
                TC              ENDOFJOB

#          CREWMANU     VERB 49            DESCRIPTION
#              START AUTOMATIC ATTITUDE MANEUVER
#              1. REQUIRE PROGRAM 00 ACTIVE.
#              2. SET EXT VERB DISPLAY BUSY FLAG.
#              3. SCHEDULE R62DISP WITH PRIORITY 10.
#              4. RELEASE EXT VERB DISPLAY.

#            R62DISP
#              1. DISPLAY FLASHING V06,N22.
#                 RESPONSES
#                 A. TERMINATE
#                    1. GO TO GOTOPOOH.
#                 B. PROCEED
#                    1. SET 3AXISFLG TO INDICATE MANEUVER IS SPECIFIED BY 3 AXIS.
#                    2. EXECUTE R60LEM (ATTITUDE MANEUVER).
#                 C. ENTER
#                    1. REPEAT FLASHING V06,N22.

CREWMANU        TC              CHKPOOH                 # DEMAND POO

                TC              TESTXACT

                CAF             PRIO10
                TC              FINDVAC
                EBANK=          BCDU
                2CADR           R62DISP
                TC              ENDOFJOB

# V60      VERB 60, DISPLAY DAP ATTITUDE ERRORS ON FDAI ATTITUDE ERROR NEEDLES.

DAPATTER        TC              DOWNFLAG
                ADRES           NEEDLFLG
                TC              GOPIN

# V63      VERB 63, DISPLAY TOTAL ATTITUDE ERRORS ON FDAI ATTITUDE ERROR NEEDLES.

TOTATTER        TC              UPFLAG
                ADRES           NEEDLFLG
                TC              GOPIN


# TRMTRACK     VERB 56                     DESCRIPTION
#              TERMINATE TRACKING (P20 AND P25).
#              1. KNOCK DOWN RENDEZVOUS, TRACK, AND UPDATE FLAGS.
#              2. REQUIRE P20 OR  P25 NOT RUNNING ALONE OR GO TO GOTOPOOH (REQUEST PROGRAM 00).
#              3. SCHEDULE V56TOVAC WITH PRIORITY 30.

#              V56TOVAC
#              1. EXECUTE INTSTALL (IF INTEGRATION IS RUNNING, STALL UNTIL IT IS FINISHED.).
#              2. ZERO GROUP 2 TO HALT P20.
#              3. TRANSFER CONTROL TO GOPROG2 (SOFTWARE RESTART).

TRMTRACK        CA              BITS9+7                 # IS REND OR P25 FLAG ON
                MASK            FLAGWRD0
                EXTEND
                BZF             GOPIN                   # NO

                TC              DOWNFLAG
                ADRES           RNDVZFLG

                TC              DOWNFLAG
                ADRES           P25FLAG

                CA              TRACKBIT                # IS TRACK FLAG ON?
                MASK            FLAGWRD1
                EXTEND
                BZF             GOPIN

                TC              DOWNFLAG
                ADRES           UPDATFLG                # UPDATE FLAG DOWN
                TC              DOWNFLAG
                ADRES           TRACKFLG                # TRACK FLAG DOWN
                TC              DOWNFLAG
                ADRES           IMUSE

                CAF             PRIO15
                TC              PRIOCHNG

                TC              INTPRET
                CALL
                                INTSTALL                # DONT INTERRUPT INTEGRATION
                EXIT

                TC              PHASCHNG

                OCT             2                       # KILL GROUP 2 TO HALT P20 ACTIVITY

                INHINT
                TC              IBNKCALL                # ZERO THE COMMANDED RATES TO STOP
                CADR            STOPRATE                # MANEUVER

                TC              IBNKCALL
                CADR            RESTORDB

                TC              IBNKCALL                # CLEAR BITS 10 + 15 OF RADMODES.
                CADR            CLRADMOD

                CS              BIT14                   # DISABLE LOCKON
                EXTEND
                WAND            CHAN12
                TC              POSTJUMP
                CADR            GOPROG2                 # CAUSE RESTART.

BITS9+7         OCT             500


#          DNEDUMP     VERB 74             DESCRIPTION
#              INITIALIZE DOWN-TELEMETRY PROGRAM FOR ERASABLE MEMORY DUMP.
#              1. SET EXT VERB DISPLAY BUSY FLAG.
#              2. REPLACE CURRENT DOWNLIST WITH ERASABLE MEMORY.
#              3. RELEASE EXT VERB DISPLAY.

                SETLOC          EXTVERBS
                BANK

                COUNT*          $$/EXTVB

                EBANK=          400
DNEDUMP         TC              TESTXACT
                CAF             LDNDUMPI
                TS              DNTMGOTO
                TC              ENDEXT

V74             EQUALS          DNEDUMP
LDNDUMPI        REMADR          DNDUMPI


#          LEMVEC     VERB 80              DESCRIPTION
#              UPDATE LEM STATE VECTOR
#                 RESET VEHUPFLG TO 0

LEMVEC          TC              CHECKR32
                TC              DOWNFLAG
                ADRES           VEHUPFLG                # VB 80 - VEHUPFLG DOWN INDICATES LEM

                TC              NOUPDOWN
#          CSMVEC     VERB 81              DESCRIPTION
#              UPDATE CSM STATE VECTOR
#                 SET   VEHUPFLG TO 1

CSMVEC          TC              CHECKR32
                TC              UPFLAG
                ADRES           VEHUPFLG                # VB 81 - VEHUPFLG UP INDICATES CSM

NOUPDOWN        TC              DOWNFLAG
                ADRES           NOUPFLAG

                TC              GOPIN

CHECKR32        CS              FLAGWRD8
                MASK            R32FLBIT
                EXTEND
                BZF             ALM/END
                TC              Q

#          UPDATOFF   VERB 95      DESCRIPTION
#              INHIBIT STATE VECTOR UPDATES BY INCORP
#                 SET NOUPFLAG TO 1

UPDATOFF        TC              UPFLAG                  # VB 95 SET NOUPFLAG
                ADRES           NOUPFLAG

                TC              GOPIN

#          SYSTEST     VERB 92             DESCRIPTION
#            OPERATE IMU PERFORMANCE TEST.
#              1. REQUIRE PROGRAM 00 OR TURN ON OPERATOR ERROR.
#              2. SET EXT VERB BUSY FLAG.
                EBANK=          QPLACE

SYSTEST         TC              CHKPOOH                 # DEMAND POO

                TC              TESTXACT

                CAF             PRIO22
                TC              FINDVAC
                EBANK=          QPLACE
                SBANK=          IMUSUPER
                2CADR           REDO

                TC              ENDOFJOB

# VERB 93         CLEAR RENDWFLG, CAUSES W-MATRIX TO BE RE-INITIALIZED.

WMATRXNG        INHINT
                CS              RENDWBIT
                MASK            FLAGWRD5
                TS              FLAGWRD5

                TC              GOPIN

GOSHOSUM        EQUALS          SHOWSUM

SHOWSUM         TC              CHKPOOH                 # *
                TC              TESTXACT                # *
                CAF             PRIO7                   # ALLOW OTHER CHARINS.
                TC              PRIOCHNG
                CAF             S+1                     # *
                TS              SKEEP6                  # * SHOWSUM OPTION
                CAF             S+ZERO                  # *
                TS              SMODE                   # * TURN OFF SELF-CHECK
                CA              SELFADRS                # *
                TS              SELFRET                 # *
                TC              STSHOSUM                # * ENTER ROPECHK

SDISPLAY        LXCH            SKEEP2                  # * BANK # FOR DISPLAY
                LXCH            SKEEP3                  # * BUGGER WORD FOR DISPLAY
NOKILL          CA              ADRS1                   # *
                TS              MPAC            +2      # *
                CA              VNCON                   # * 0501
                TC              BANKCALL                # *
                CADR            GOXDSPF                 # *
                TC              +3                      # *
                TC              NXTBNK                  # *

                TC              NOKILL                  # *
                CA              SELFADRS
                TS              SKEEP1

                TC              ENDEXT                  # *

VNCON           VN              501                     # *

ENDSUMS         CA              SKEEP6                  # *
                EXTEND                                  # *
                BZF             SELFCHK                 # * ROPECHK, START SELFCHK AGAIN.
                TC              STSHOSUM                # * START SHOWSUM AGAIN.

#          DAPDISP     VERB 48             DESCRIPTION
#              LOAD AUTO PILOT  DATA
#              1. REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG.
#              2. EXECUTE DAPDATA1, DAPDATA2, AND DAPDATA3.
#              3. RELEASE EXT VERB DISPLAY SYSTEM.
DAPDISP         TC              TESTXACT
                CAF             PRIO7                   # R03
                TC              PRIOCHNG
                TC              POSTJUMP
                CADR            DAPDATA1

                BANK            34
                SETLOC          LOADDAP
                BANK

                COUNT*          $$/R03

                SBANK=          LOWSUPER                # FOR SUBSEQUENT LOW 2CADR'S.

DAPDATA1        TC              UNK7766
                CAF             BOOLSMSK                # SET DISPLAY ACCORDING TO DAPBOOLS BITS.
                MASK            DAPBOOLS                # LM
RELOAD          TS              DAPDATR1                # LM
                CAF             V01N46                  # LM
                TC              BANKCALL
                CADR            GOXDSPFR
                TCF             ENDEXT                  # V34E  TERMINATE
                TCF             DPDAT1                  # V33E  PROCEED
                TCF             MSKDATR1                # E     NEW DATA    CHECK AND REDISPLAY
                CAF             REVCNT                  # BITS 2 & 3:  BLANKS R2 & R3.
                TC              BLANKET
                TCF             ENDOFJOB
MSKDATR1        CAF             BOOLSMSK
                MASK            DAPDATR1
                TCF             RELOAD

DPDAT1          INHINT                                  # INHINT FOR SETTING OF FLAG BITS AND MASS
                CA              DAPDATR1                #   ON BASIS OF DISPLAYED DAPDATR1.
                MASK            CSMDOCKD
                EXTEND
                BZF             ONEMASS

                CAF             BIT2
                EXTEND
                RAND            CHAN30
                EXTEND
                BZF             ONEMASS -1

                TC              ALARM
                OCT             1706
                CAF             VB05N09
                TC              BANKCALL
                CADR            GOXDSPF
                TCF             ENDEXT
                TCF             -4
                TCF             DAPDATA1

                CAE             CSMMASS
ONEMASS         AD              LEMMASS
                TS              MASS
                CS              BOOLSMSK
                MASK            DAPBOOLS
                AD              DAPDATR1
                TS              DAPBOOLS
                MASK            ACC4OR2X                # 2 OR 4 JET X-TRANSLATION
                EXTEND                                  # (BIT ACC4OR2X = 1 FOR 4 JETS)
                BZF             +5
                CS              BIT15
                MASK            FLAGWRD1                # CLEAR NJTSFLAG TO 0 FOR 4 JETS
                TS              FLAGWRD1
                TCF             +4
                CS              FLAGWRD1                # SET NJTSFLAG TO 1 FOR 2 JETS
                MASK            BIT15
                ADS             FLAGWRD1
                CA              DAPBOOLS                # SELECT DESIRED KALCMANU AUTOMATIC
                MASK            THREE                   # MANEUVER RATE
                DOUBLE                                  # RATEINDX HAS TO BE 0,2,4,6 SINCE RATES
                TS              RATEINDX                # ARE DP
                RELINT
                TC              DAPDATA2

BOOLSMSK        OCT             13113
V0647           VN              0647
V01N46          VN              0146
MINLMD          DEC             -2850           B-16    # MIN. DESCENT STAGE MASS -- 2(16) KG.
MINMINLM        DEC             -2200           B-16    # MIN ASCENT STAGE MASS -- 2(16) KG.
MINCSM          =               BIT11                   # MIN CSM MASS (OK FOR 1/ACCS) = 9050 LBS

DAPDATA2        CAF             V0647
                TC              BANKCALL
                CADR            GOXDSPFR
                TCF             ENDR03                  # V34E  TERMINATE. FIRST SET DB, DO 1/ACCS
                TCF             DAPDAT2                 # V33E  PROCEED
                TCF             DAPDATA2                #       LOAD NEW DATA AND RECYCLE
                CAF             BIT3                    # BLANKS R3
                TC              BLANKET                 #            LM
                TCF             ENDOFJOB
ENDR03          INHINT
                TC              IBNKCALL
                CADR            RESTORDB
                TCF             ENDEXT                  # DOES RELINT

DAPDAT2         EXTEND                                  # DETERMINE STAGE
                READ            CHAN30
                COM
                MASK            BIT2
                CCS             A
                CA              MINLMD
                AD              MINMINLM
                AD              LEMMASS                 # LEMMASS MUST BE GREATER THAN EMPTY LEM
                EXTEND
                BZMF            DAPDATA2                # ASK FOR NEW MASSES
                CAE             DAPBOOLS
                MASK            CSMDOCKD
                EXTEND
                BZF             LEMALONE                # SKIP TEST ON CSMMASS IF NOT DOCKED.
                CS              MINCSM                  # TEST CSM MASS
                AD              CSMMASS                 # CSMMASS MUST BE GREATER THAN EMPTY CSM

                EXTEND
                BZMF            DAPDATA2                # ASK FOR NEW MASSES
                CAE             CSMMASS                 # DOCKED:  MASS = CSMMASS + LEMMASS
LEMALONE        AD              LEMMASS                 # LEM ALONE:  MASS = LEMMASS
                ZL
                DXCH            MASS
                INHINT
                TC              IBNKCALL                # SET DEADBANK AND COMPUTE MOMENTS OF
                CADR            RESTORDB                #   INERTIA.
                RELINT                                  # PROCEED TO NOUN 48 (OR END).

DAPDATA3        CAF             BIT2
                EXTEND
                RAND            CHAN30
                CCS             A                       # END ROUTINE IF LEM HAS STAGED,
                TC              ENDEXT
                CAF             V06N48                  # DISPLAY TRIM ANGLES AND REQUEST RESPONSE
                TC              BANKCALL
                CADR            GOXDSPFR
                TC              ENDEXT
                TCF             DPDAT3                  # V33E GO DO TRIM (WAITLIST TO TRIMGIMB)
                TCF             -5                      #      LOAD NEW DATA AND RECYCLE
                CAF             BIT3
                TC              BLANKET                 # BLANK R3
                TCF             ENDOFJOB
DPDAT3          CAF             BIT1                    # GO TO TRIMGIMB VIA WAITLIST SO IT
                INHINT                                  # CAN USE FIXDELAY AND VARDELAY
                TC              WAITLIST
                EBANK=          ROLLTIME
                2CADR           TRIMGIMB
                TCF             ENDOFJOB                # DOES A RELINT
TRIMDONE        CAF             V50N48
                TC              BANKCALL                # TRIM IS FINISHED; PLEASE TERMINATE R03
                CADR            GOMARK3R
                TC              ENDEXT                  # V34E TERMINATE
                TC              ENDEXT
                TC              ENDEXT
                CAF             OCT24                   # BIT5 TO CHANGE TO PERFORM, 3 TO BLANK R3
                TC              BLANKET
                TCF             ENDOFJOB

V06N48          VN              0648

V50N48          VN              5048


# VERB 66.  VEHICLES ARE ATTACHED.  MOVE THIS VEHICLE STATE VECTOR TO
#           OTHER VEHICLE STATE VECTOR.

#     USE SUBROUTINE GENTRAN.

                BANK            7
                SETLOC          EXTVERBS
                BANK

                COUNT*          $$/EXTVB

                EBANK=          RRECTHIS

ATTACHED        CAF             EBANK3
                TS              EBANK
                TC              INTPRET
                CALL
                                INTSTALL
                BON             CLRGO
                                MOONTHIS
                                +3
                                MOONOTH
                                +3
                SET
                                MOONOTH
                EXIT
                CAF             OCT51
                TC              GENTRAN
                ADRES           RRECTHIS                # OUR STATE VECTOR INTO OTHER VIA GENTRAN
                ADRES           RRECTOTH

                RELINT

                CAF             TCPINAD
                INDEX           FIXLOC
                TS              QPRET
                TC              POSTJUMP
                CADR            INTWAKE                 # FREE INTEGRATION AND EXIT.


TCPIN           RTB
                                PINBRNCH

OCT51           OCT             51
TCPINAD         CADR            TCPIN

# VERB 96  SET QUITFLAG TO STOP INTEGRATION.

#          GO TO V37 WITH ZERO TO CAUSE POO.
#          STATEINT WILL CHECK QUITFLAG AND SKIP 1ST PASS,
#                 THUS ALLOWING A 10 MINUTE PERIOD WITHOUT INTEGRATION.

VERB96          TC              UPFLAG                  # QUITFLAG WILL CAUSE INTEGRATION TO EXIT
                ADRES           QUITFLAG                #       AT NEXT TIMESTEP

                CAF             ZERO
                TC              POSTJUMP
                CADR            V37                     # GO TO POO


# VERB 45:     DISPLAY OF W MATRIX

V45             TC              TESTXACT
                CAF             PRIO5
                TC              FINDVAC
                EBANK=          QPLACE
                2CADR           V45CALL

                TC              ENDOFJOB

# VERB 65          DISABLE U,V JETS DURING DPS BURNS

SNUFFOUT        TC              UPFLAG
                ADRES           SNUFFER
                TC              GOPIN

# VERB 75          ENABLE U,V JETS DURING DPS BURNS

OUTSNUFF        TC              DOWNFLAG
                ADRES           SNUFFER
                TC              GOPIN
