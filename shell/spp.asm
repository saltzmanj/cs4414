; Disassembly of file: spp
; Thu Mar  9 23:01:11 2017
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro, x64

default rel

global __TMC_END__
global __bss_start
global _edata
global _end
global _init: function
global _start: function
global main: function
global SppRun: function
global SppIterate: function
global GrabLine: function
global CheckSyntax: function
global HandleError: function
global ExtractCmds: function
global RunExtractor: function
global DebugPrintCommands: function
global SetRedirs: function
global SetUpAndExecute: function
global CheckPipingRules: function
global SppChdir: function
global SppExit: function
global SppHelp: function
global __libc_csu_init: function
global __libc_csu_fini: function
global _fini: function
global _IO_stdin_used
global __data_start
global data_start                                       ; Note: Weak.
global __dso_handle
global sppcommand_strings
global SppCommands
global stdin@@GLIBC_2.2.5
global stdin
global pregex

extern fork@@GLIBC_2.2.5                                ; near
extern _ITM_registerTMCloneTable                        ; byte
extern exit@@GLIBC_2.2.5                                ; near
extern execvp@@GLIBC_2.2.5                              ; near
extern _Jv_RegisterClasses                              ; byte
extern strtok@@GLIBC_2.2.5                              ; near
extern open@@GLIBC_2.2.5                                ; near
extern waitpid@@GLIBC_2.2.5                             ; near
extern regexec@@GLIBC_2.3.4                             ; near
extern malloc@@GLIBC_2.2.5                              ; near
extern __gmon_start__                                   ; byte
extern getchar@@GLIBC_2.2.5                             ; near
extern strcmp@@GLIBC_2.2.5                              ; near
extern calloc@@GLIBC_2.2.5                              ; near
extern __libc_start_main@@GLIBC_2.2.5                   ; near
extern regcomp@@GLIBC_2.2.5                             ; near
extern pipe@@GLIBC_2.2.5                                ; near
extern close@@GLIBC_2.2.5                               ; near
extern fgetc@@GLIBC_2.2.5                               ; near
extern printf@@GLIBC_2.2.5                              ; near
extern dup2@@GLIBC_2.2.5                                ; near
extern __stack_chk_fail@@GLIBC_2.4                      ; near
extern chdir@@GLIBC_2.2.5                               ; near
extern strlen@@GLIBC_2.2.5                              ; near
extern puts@@GLIBC_2.2.5                                ; near
extern strcpy@@GLIBC_2.2.5                              ; near
extern _ITM_deregisterTMCloneTable                      ; byte
extern free@@GLIBC_2.2.5                                ; near
extern fork                                             ; near
extern exit                                             ; near
extern execvp                                           ; near
extern strtok                                           ; near
extern open                                             ; near
extern waitpid                                          ; near
extern regexec                                          ; near
extern malloc                                           ; near
extern __gmon_start__                                   ; near
extern getchar                                          ; near
extern strcmp                                           ; near
extern calloc                                           ; near
extern __libc_start_main                                ; near
extern regcomp                                          ; near
extern pipe                                             ; near
extern close                                            ; near
extern fgetc                                            ; near
extern printf                                           ; near
extern dup2                                             ; near
extern __stack_chk_fail                                 ; near
extern chdir                                            ; near
extern strlen                                           ; near
extern puts                                             ; near
extern strcpy                                           ; near
extern free                                             ; near


SECTION .interp align=1 noexecute                       ; section number 1, const

        db 2FH, 6CH, 69H, 62H, 36H, 34H, 2FH, 6CH       ; 00400238 _ /lib64/l
        db 64H, 2DH, 6CH, 69H, 6EH, 75H, 78H, 2DH       ; 00400240 _ d-linux-
        db 78H, 38H, 36H, 2DH, 36H, 34H, 2EH, 73H       ; 00400248 _ x86-64.s
        db 6FH, 2EH, 32H, 00H                           ; 00400250 _ o.2.


SECTION .note.ABI-tag align=4 noexecute                 ; section number 2, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 00400254 _ ........
        db 01H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0040025C _ ....GNU.
        db 00H, 00H, 00H, 00H, 02H, 00H, 00H, 00H       ; 00400264 _ ........
        db 06H, 00H, 00H, 00H, 20H, 00H, 00H, 00H       ; 0040026C _ .... ...


SECTION .note.gnu.build-id align=4 noexecute            ; section number 3, const

        db 04H, 00H, 00H, 00H, 14H, 00H, 00H, 00H       ; 00400274 _ ........
        db 03H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0040027C _ ....GNU.
        db 0E7H, 72H, 23H, 27H, 0D6H, 0B0H, 23H, 0DCH   ; 00400284 _ .r#'..#.
        db 94H, 9AH, 8CH, 0DEH, 77H, 0C2H, 6AH, 2FH     ; 0040028C _ ....w.j/
        db 0BDH, 5CH, 0F4H, 0B5H                        ; 00400294 _ .\..


SECTION .gnu.hash align=8 noexecute                     ; section number 4, const

        db 02H, 00H, 00H, 00H, 1AH, 00H, 00H, 00H       ; 00400298 _ ........
        db 01H, 00H, 00H, 00H, 06H, 00H, 00H, 00H       ; 004002A0 _ ........
        db 00H, 00H, 20H, 00H, 80H, 00H, 00H, 00H       ; 004002A8 _ .. .....
        db 00H, 00H, 00H, 00H, 1AH, 00H, 00H, 00H       ; 004002B0 _ ........
        db 67H, 55H, 61H, 10H                           ; 004002B8 _ gUa.


SECTION .dynsym align=8 noexecute                       ; section number 5, const

        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002C0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002C8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002D0 _ ........
        db 0BCH, 00H, 00H, 00H, 12H, 00H, 00H, 00H      ; 004002D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002E8 _ ........
        db 0BH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004002F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002F8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400300 _ ........
        db 24H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400308 _ $.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400310 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400318 _ ........
        db 60H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400320 _ `.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400328 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400330 _ ........
        db 6FH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400338 _ o.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400340 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400348 _ ........
        db 2EH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400350 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400358 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400360 _ ........
        db 75H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400368 _ u.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400370 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400378 _ ........
        db 45H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400380 _ E.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400388 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400390 _ ........
        db 53H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400398 _ S.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003A0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003A8 _ ........
        db 98H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004003B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003B8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003C0 _ ........
        db 1FH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004003C8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003D8 _ ........
        db 81H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004003E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003F0 _ ........
        db 0AAH, 00H, 00H, 00H, 12H, 00H, 00H, 00H      ; 004003F8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400400 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400408 _ ........
        db 59H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400410 _ Y.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400418 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400420 _ ........
        db 0A3H, 00H, 00H, 00H, 12H, 00H, 00H, 00H      ; 00400428 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400430 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400438 _ ........
        db 67H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400440 _ g.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400448 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400450 _ ........
        db 0C1H, 00H, 00H, 00H, 20H, 00H, 00H, 00H      ; 00400458 _ .... ...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400460 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400468 _ ........
        db 7AH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400470 _ z.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400478 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400480 _ ........
        db 17H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400488 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400490 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400498 _ ........
        db 90H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004004A0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004004A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004004B0 _ ........
        db 9EH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004004B8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004004C0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004004C8 _ ........
        db 4CH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004004D0 _ L.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004004D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004004E0 _ ........
        db 89H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004004E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004004F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004004F8 _ ........
        db 12H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400500 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400508 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400510 _ ........
        db 29H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400518 _ ).......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400520 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400528 _ ........
        db 3FH, 00H, 00H, 00H, 11H, 00H, 1AH, 00H       ; 00400530 _ ?.......
        db 40H, 41H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400538 _ @A`.....
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400540 _ ........


SECTION .dynstr align=1 noexecute                       ; section number 6, const

        db 00H, 6CH, 69H, 62H, 63H, 2EH, 73H, 6FH       ; 00400548 _ .libc.so
        db 2EH, 36H, 00H, 73H, 74H, 72H, 63H, 70H       ; 00400550 _ .6.strcp
        db 79H, 00H, 65H, 78H, 69H, 74H, 00H, 72H       ; 00400558 _ y.exit.r
        db 65H, 67H, 65H, 78H, 65H, 63H, 00H, 70H       ; 00400560 _ egexec.p
        db 69H, 70H, 65H, 00H, 70H, 75H, 74H, 73H       ; 00400568 _ ipe.puts
        db 00H, 66H, 6FH, 72H, 6BH, 00H, 5FH, 5FH       ; 00400570 _ .fork.__
        db 73H, 74H, 61H, 63H, 6BH, 5FH, 63H, 68H       ; 00400578 _ stack_ch
        db 6BH, 5FH, 66H, 61H, 69H, 6CH, 00H, 73H       ; 00400580 _ k_fail.s
        db 74H, 64H, 69H, 6EH, 00H, 70H, 72H, 69H       ; 00400588 _ tdin.pri
        db 6EH, 74H, 66H, 00H, 73H, 74H, 72H, 74H       ; 00400590 _ ntf.strt
        db 6FH, 6BH, 00H, 66H, 67H, 65H, 74H, 63H       ; 00400598 _ ok.fgetc
        db 00H, 63H, 61H, 6CH, 6CH, 6FH, 63H, 00H       ; 004005A0 _ .calloc.
        db 73H, 74H, 72H, 6CH, 65H, 6EH, 00H, 67H       ; 004005A8 _ strlen.g
        db 65H, 74H, 63H, 68H, 61H, 72H, 00H, 63H       ; 004005B0 _ etchar.c
        db 68H, 64H, 69H, 72H, 00H, 64H, 75H, 70H       ; 004005B8 _ hdir.dup
        db 32H, 00H, 6DH, 61H, 6CH, 6CH, 6FH, 63H       ; 004005C0 _ 2.malloc
        db 00H, 72H, 65H, 67H, 63H, 6FH, 6DH, 70H       ; 004005C8 _ .regcomp
        db 00H, 65H, 78H, 65H, 63H, 76H, 70H, 00H       ; 004005D0 _ .execvp.
        db 77H, 61H, 69H, 74H, 70H, 69H, 64H, 00H       ; 004005D8 _ waitpid.
        db 63H, 6CH, 6FH, 73H, 65H, 00H, 6FH, 70H       ; 004005E0 _ close.op
        db 65H, 6EH, 00H, 73H, 74H, 72H, 63H, 6DH       ; 004005E8 _ en.strcm
        db 70H, 00H, 5FH, 5FH, 6CH, 69H, 62H, 63H       ; 004005F0 _ p.__libc
        db 5FH, 73H, 74H, 61H, 72H, 74H, 5FH, 6DH       ; 004005F8 _ _start_m
        db 61H, 69H, 6EH, 00H, 66H, 72H, 65H, 65H       ; 00400600 _ ain.free
        db 00H, 5FH, 5FH, 67H, 6DH, 6FH, 6EH, 5FH       ; 00400608 _ .__gmon_
        db 73H, 74H, 61H, 72H, 74H, 5FH, 5FH, 00H       ; 00400610 _ start__.
        db 47H, 4CH, 49H, 42H, 43H, 5FH, 32H, 2EH       ; 00400618 _ GLIBC_2.
        db 33H, 2EH, 34H, 00H, 47H, 4CH, 49H, 42H       ; 00400620 _ 3.4.GLIB
        db 43H, 5FH, 32H, 2EH, 34H, 00H, 47H, 4CH       ; 00400628 _ C_2.4.GL
        db 49H, 42H, 43H, 5FH, 32H, 2EH, 32H, 2EH       ; 00400630 _ IBC_2.2.
        db 35H, 00H                                     ; 00400638 _ 5.


SECTION .gnu.version align=2 noexecute                  ; section number 7, const

        db 00H, 00H, 02H, 00H, 02H, 00H, 02H, 00H       ; 0040063A _ ........
        db 02H, 00H, 02H, 00H, 03H, 00H, 02H, 00H       ; 00400642 _ ........
        db 02H, 00H, 02H, 00H, 02H, 00H, 02H, 00H       ; 0040064A _ ........
        db 02H, 00H, 02H, 00H, 02H, 00H, 02H, 00H       ; 00400652 _ ........
        db 02H, 00H, 00H, 00H, 02H, 00H, 04H, 00H       ; 0040065A _ ........
        db 02H, 00H, 02H, 00H, 02H, 00H, 02H, 00H       ; 00400662 _ ........
        db 02H, 00H, 02H, 00H, 02H, 00H                 ; 0040066A _ ......


SECTION .gnu.version_r align=8 noexecute                ; section number 8, const

        db 01H, 00H, 03H, 00H, 01H, 00H, 00H, 00H       ; 00400670 _ ........
        db 10H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400678 _ ........
        db 74H, 19H, 69H, 09H, 00H, 00H, 04H, 00H       ; 00400680 _ t.i.....
        db 0D0H, 00H, 00H, 00H, 10H, 00H, 00H, 00H      ; 00400688 _ ........
        db 14H, 69H, 69H, 0DH, 00H, 00H, 03H, 00H       ; 00400690 _ .ii.....
        db 0DCH, 00H, 00H, 00H, 10H, 00H, 00H, 00H      ; 00400698 _ ........
        db 75H, 1AH, 69H, 09H, 00H, 00H, 02H, 00H       ; 004006A0 _ u.i.....
        db 0E6H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 004006A8 _ ........


SECTION .rela.dyn align=8 noexecute                     ; section number 9, const

        db 0F8H, 3FH, 60H, 00H, 00H, 00H, 00H, 00H      ; 004006B0 _ .?`.....
        db 06H, 00H, 00H, 00H, 11H, 00H, 00H, 00H       ; 004006B8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004006C0 _ ........
        db 40H, 41H, 60H, 00H, 00H, 00H, 00H, 00H       ; 004006C8 _ @A`.....
        db 05H, 00H, 00H, 00H, 1AH, 00H, 00H, 00H       ; 004006D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004006D8 _ ........


SECTION .rela.plt align=8 noexecute                     ; section number 10, const

        db 18H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 004006E0 _ .@`.....
        db 07H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 004006E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004006F0 _ ........
        db 20H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 004006F8 _  @`.....
        db 07H, 00H, 00H, 00H, 02H, 00H, 00H, 00H       ; 00400700 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400708 _ ........
        db 28H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400710 _ (@`.....
        db 07H, 00H, 00H, 00H, 03H, 00H, 00H, 00H       ; 00400718 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400720 _ ........
        db 30H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400728 _ 0@`.....
        db 07H, 00H, 00H, 00H, 04H, 00H, 00H, 00H       ; 00400730 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400738 _ ........
        db 38H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400740 _ 8@`.....
        db 07H, 00H, 00H, 00H, 05H, 00H, 00H, 00H       ; 00400748 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400750 _ ........
        db 40H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400758 _ @@`.....
        db 07H, 00H, 00H, 00H, 06H, 00H, 00H, 00H       ; 00400760 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400768 _ ........
        db 48H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400770 _ H@`.....
        db 07H, 00H, 00H, 00H, 07H, 00H, 00H, 00H       ; 00400778 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400780 _ ........
        db 50H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400788 _ P@`.....
        db 07H, 00H, 00H, 00H, 08H, 00H, 00H, 00H       ; 00400790 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400798 _ ........
        db 58H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 004007A0 _ X@`.....
        db 07H, 00H, 00H, 00H, 09H, 00H, 00H, 00H       ; 004007A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004007B0 _ ........
        db 60H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 004007B8 _ `@`.....
        db 07H, 00H, 00H, 00H, 0AH, 00H, 00H, 00H       ; 004007C0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004007C8 _ ........
        db 68H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 004007D0 _ h@`.....
        db 07H, 00H, 00H, 00H, 0BH, 00H, 00H, 00H       ; 004007D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004007E0 _ ........
        db 70H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 004007E8 _ p@`.....
        db 07H, 00H, 00H, 00H, 0CH, 00H, 00H, 00H       ; 004007F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004007F8 _ ........
        db 78H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400800 _ x@`.....
        db 07H, 00H, 00H, 00H, 0DH, 00H, 00H, 00H       ; 00400808 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400810 _ ........
        db 80H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400818 _ .@`.....
        db 07H, 00H, 00H, 00H, 0EH, 00H, 00H, 00H       ; 00400820 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400828 _ ........
        db 88H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400830 _ .@`.....
        db 07H, 00H, 00H, 00H, 0FH, 00H, 00H, 00H       ; 00400838 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400840 _ ........
        db 90H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400848 _ .@`.....
        db 07H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 00400850 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400858 _ ........
        db 98H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400860 _ .@`.....
        db 07H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 00400868 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400870 _ ........
        db 0A0H, 40H, 60H, 00H, 00H, 00H, 00H, 00H      ; 00400878 _ .@`.....
        db 07H, 00H, 00H, 00H, 13H, 00H, 00H, 00H       ; 00400880 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400888 _ ........
        db 0A8H, 40H, 60H, 00H, 00H, 00H, 00H, 00H      ; 00400890 _ .@`.....
        db 07H, 00H, 00H, 00H, 14H, 00H, 00H, 00H       ; 00400898 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004008A0 _ ........
        db 0B0H, 40H, 60H, 00H, 00H, 00H, 00H, 00H      ; 004008A8 _ .@`.....
        db 07H, 00H, 00H, 00H, 15H, 00H, 00H, 00H       ; 004008B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004008B8 _ ........
        db 0B8H, 40H, 60H, 00H, 00H, 00H, 00H, 00H      ; 004008C0 _ .@`.....
        db 07H, 00H, 00H, 00H, 16H, 00H, 00H, 00H       ; 004008C8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004008D0 _ ........
        db 0C0H, 40H, 60H, 00H, 00H, 00H, 00H, 00H      ; 004008D8 _ .@`.....
        db 07H, 00H, 00H, 00H, 17H, 00H, 00H, 00H       ; 004008E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004008E8 _ ........
        db 0C8H, 40H, 60H, 00H, 00H, 00H, 00H, 00H      ; 004008F0 _ .@`.....
        db 07H, 00H, 00H, 00H, 18H, 00H, 00H, 00H       ; 004008F8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400900 _ ........
        db 0D0H, 40H, 60H, 00H, 00H, 00H, 00H, 00H      ; 00400908 _ .@`.....
        db 07H, 00H, 00H, 00H, 19H, 00H, 00H, 00H       ; 00400910 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400918 _ ........


SECTION .init   align=4 execute                         ; section number 11, code

_init:  ; Function begin
        sub     rsp, 8                                  ; 00400920 _ 48: 83. EC, 08
        mov     rax, qword [rel ?_197]                  ; 00400924 _ 48: 8B. 05, 002036CD(rel)
        test    rax, rax                                ; 0040092B _ 48: 85. C0
        jz      ?_001                                   ; 0040092E _ 74, 05
        call    ?_051                                   ; 00400930 _ E8, 0000019B(rel)
?_001:  add     rsp, 8                                  ; 00400935 _ 48: 83. C4, 08
        ret                                             ; 00400939 _ C3
; _init End of function


SECTION .plt    align=16 execute                        ; section number 12, code

?_002:  push    qword [rel ?_198]                       ; 00400940 _ FF. 35, 002036C2(rel)
        jmp     near [rel ?_199]                        ; 00400946 _ FF. 25, 002036C4(rel)

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_003:  jmp     near [rel ?_200]                        ; 00400950 _ FF. 25, 002036C2(rel)

?_004:
; Note: Immediate operand could be made smaller by sign extension
        push    0                                       ; 00400956 _ 68, 00000000
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 0040095B _ E9, FFFFFFE0

?_005:  jmp     near [rel ?_201]                        ; 00400960 _ FF. 25, 002036BA(rel)

?_006:
; Note: Immediate operand could be made smaller by sign extension
        push    1                                       ; 00400966 _ 68, 00000001
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 0040096B _ E9, FFFFFFD0

?_007:  jmp     near [rel ?_202]                        ; 00400970 _ FF. 25, 002036B2(rel)

?_008:
; Note: Immediate operand could be made smaller by sign extension
        push    2                                       ; 00400976 _ 68, 00000002
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 0040097B _ E9, FFFFFFC0

?_009:  jmp     near [rel ?_203]                        ; 00400980 _ FF. 25, 002036AA(rel)

?_010:
; Note: Immediate operand could be made smaller by sign extension
        push    3                                       ; 00400986 _ 68, 00000003
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 0040098B _ E9, FFFFFFB0

?_011:  jmp     near [rel ?_204]                        ; 00400990 _ FF. 25, 002036A2(rel)

?_012:
; Note: Immediate operand could be made smaller by sign extension
        push    4                                       ; 00400996 _ 68, 00000004
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 0040099B _ E9, FFFFFFA0

?_013:  jmp     near [rel ?_205]                        ; 004009A0 _ FF. 25, 0020369A(rel)

?_014:
; Note: Immediate operand could be made smaller by sign extension
        push    5                                       ; 004009A6 _ 68, 00000005
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 004009AB _ E9, FFFFFF90

?_015:  jmp     near [rel ?_206]                        ; 004009B0 _ FF. 25, 00203692(rel)

?_016:
; Note: Immediate operand could be made smaller by sign extension
        push    6                                       ; 004009B6 _ 68, 00000006
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 004009BB _ E9, FFFFFF80

?_017:  jmp     near [rel ?_207]                        ; 004009C0 _ FF. 25, 0020368A(rel)

?_018:
; Note: Immediate operand could be made smaller by sign extension
        push    7                                       ; 004009C6 _ 68, 00000007
        jmp     ?_002                                   ; 004009CB _ E9, FFFFFF70

?_019:  jmp     near [rel ?_208]                        ; 004009D0 _ FF. 25, 00203682(rel)

?_020:
; Note: Immediate operand could be made smaller by sign extension
        push    8                                       ; 004009D6 _ 68, 00000008
        jmp     ?_002                                   ; 004009DB _ E9, FFFFFF60

?_021:  jmp     near [rel ?_209]                        ; 004009E0 _ FF. 25, 0020367A(rel)

?_022:
; Note: Immediate operand could be made smaller by sign extension
        push    9                                       ; 004009E6 _ 68, 00000009
        jmp     ?_002                                   ; 004009EB _ E9, FFFFFF50

?_023:  jmp     near [rel ?_210]                        ; 004009F0 _ FF. 25, 00203672(rel)

?_024:
; Note: Immediate operand could be made smaller by sign extension
        push    10                                      ; 004009F6 _ 68, 0000000A
        jmp     ?_002                                   ; 004009FB _ E9, FFFFFF40

?_025:  jmp     near [rel ?_211]                        ; 00400A00 _ FF. 25, 0020366A(rel)

?_026:
; Note: Immediate operand could be made smaller by sign extension
        push    11                                      ; 00400A06 _ 68, 0000000B
        jmp     ?_002                                   ; 00400A0B _ E9, FFFFFF30

?_027:  jmp     near [rel ?_212]                        ; 00400A10 _ FF. 25, 00203662(rel)

?_028:
; Note: Immediate operand could be made smaller by sign extension
        push    12                                      ; 00400A16 _ 68, 0000000C
        jmp     ?_002                                   ; 00400A1B _ E9, FFFFFF20

?_029:  jmp     near [rel ?_213]                        ; 00400A20 _ FF. 25, 0020365A(rel)

?_030:
; Note: Immediate operand could be made smaller by sign extension
        push    13                                      ; 00400A26 _ 68, 0000000D
        jmp     ?_002                                   ; 00400A2B _ E9, FFFFFF10

?_031:  jmp     near [rel ?_214]                        ; 00400A30 _ FF. 25, 00203652(rel)

?_032:
; Note: Immediate operand could be made smaller by sign extension
        push    14                                      ; 00400A36 _ 68, 0000000E
        jmp     ?_002                                   ; 00400A3B _ E9, FFFFFF00

?_033:  jmp     near [rel ?_215]                        ; 00400A40 _ FF. 25, 0020364A(rel)

?_034:
; Note: Immediate operand could be made smaller by sign extension
        push    15                                      ; 00400A46 _ 68, 0000000F
        jmp     ?_002                                   ; 00400A4B _ E9, FFFFFEF0

?_035:  jmp     near [rel ?_216]                        ; 00400A50 _ FF. 25, 00203642(rel)

?_036:
; Note: Immediate operand could be made smaller by sign extension
        push    16                                      ; 00400A56 _ 68, 00000010
        jmp     ?_002                                   ; 00400A5B _ E9, FFFFFEE0

?_037:  jmp     near [rel ?_217]                        ; 00400A60 _ FF. 25, 0020363A(rel)

?_038:
; Note: Immediate operand could be made smaller by sign extension
        push    17                                      ; 00400A66 _ 68, 00000011
        jmp     ?_002                                   ; 00400A6B _ E9, FFFFFED0

?_039:  jmp     near [rel ?_218]                        ; 00400A70 _ FF. 25, 00203632(rel)

?_040:
; Note: Immediate operand could be made smaller by sign extension
        push    18                                      ; 00400A76 _ 68, 00000012
        jmp     ?_002                                   ; 00400A7B _ E9, FFFFFEC0

?_041:  jmp     near [rel ?_219]                        ; 00400A80 _ FF. 25, 0020362A(rel)

?_042:
; Note: Immediate operand could be made smaller by sign extension
        push    19                                      ; 00400A86 _ 68, 00000013
        jmp     ?_002                                   ; 00400A8B _ E9, FFFFFEB0

?_043:  jmp     near [rel ?_220]                        ; 00400A90 _ FF. 25, 00203622(rel)

?_044:
; Note: Immediate operand could be made smaller by sign extension
        push    20                                      ; 00400A96 _ 68, 00000014
        jmp     ?_002                                   ; 00400A9B _ E9, FFFFFEA0

?_045:  jmp     near [rel ?_221]                        ; 00400AA0 _ FF. 25, 0020361A(rel)

?_046:
; Note: Immediate operand could be made smaller by sign extension
        push    21                                      ; 00400AA6 _ 68, 00000015
        jmp     ?_002                                   ; 00400AAB _ E9, FFFFFE90

?_047:  jmp     near [rel ?_222]                        ; 00400AB0 _ FF. 25, 00203612(rel)

?_048:
; Note: Immediate operand could be made smaller by sign extension
        push    22                                      ; 00400AB6 _ 68, 00000016
        jmp     ?_002                                   ; 00400ABB _ E9, FFFFFE80

?_049:  jmp     near [rel ?_223]                        ; 00400AC0 _ FF. 25, 0020360A(rel)

?_050:  ; Local function
; Note: Immediate operand could be made smaller by sign extension
        push    23                                      ; 00400AC6 _ 68, 00000017
        jmp     ?_002                                   ; 00400ACB _ E9, FFFFFE70


SECTION .plt.got align=8 execute                        ; section number 13, code

?_051:  ; Local function
        jmp     near [rel ?_197]                        ; 00400AD0 _ FF. 25, 00203522(rel)

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8


SECTION .text   align=16 execute                        ; section number 14, code

_start: ; Function begin
        xor     ebp, ebp                                ; 00400AE0 _ 31. ED
        mov     r9, rdx                                 ; 00400AE2 _ 49: 89. D1
        pop     rsi                                     ; 00400AE5 _ 5E
        mov     rdx, rsp                                ; 00400AE6 _ 48: 89. E2
        and     rsp, 0FFFFFFFFFFFFFFF0H                 ; 00400AE9 _ 48: 83. E4, F0
        push    rax                                     ; 00400AED _ 50
        push    rsp                                     ; 00400AEE _ 54
        mov     r8, 4205664                             ; 00400AEF _ 49: C7. C0, 00402C60
        mov     rcx, 4205552                            ; 00400AF6 _ 48: C7. C1, 00402BF0
        mov     rdi, 4197334                            ; 00400AFD _ 48: C7. C7, 00400BD6
        call    ?_027                                   ; 00400B04 _ E8, FFFFFF07(rel)
        hlt                                             ; 00400B09 _ F4
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
deregister_tm_clones:
        mov     eax, 6308143                            ; 00400B10 _ B8, 0060412F
        push    rbp                                     ; 00400B15 _ 55
        sub     rax, 6308136                            ; 00400B16 _ 48: 2D, 00604128
        cmp     rax, 14                                 ; 00400B1C _ 48: 83. F8, 0E
        mov     rbp, rsp                                ; 00400B20 _ 48: 89. E5
        jbe     ?_052                                   ; 00400B23 _ 76, 1B
        mov     eax, 0                                  ; 00400B25 _ B8, 00000000
        test    rax, rax                                ; 00400B2A _ 48: 85. C0
        jz      ?_052                                   ; 00400B2D _ 74, 11
        pop     rbp                                     ; 00400B2F _ 5D
        mov     edi, 6308136                            ; 00400B30 _ BF, 00604128
        jmp     rax                                     ; 00400B35 _ FF. E0

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_052:  pop     rbp                                     ; 00400B40 _ 5D
        ret                                             ; 00400B41 _ C3
; _start End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

register_tm_clones:; Local function
        mov     esi, 6308136                            ; 00400B50 _ BE, 00604128
        push    rbp                                     ; 00400B55 _ 55
        sub     rsi, 6308136                            ; 00400B56 _ 48: 81. EE, 00604128
        sar     rsi, 3                                  ; 00400B5D _ 48: C1. FE, 03
        mov     rbp, rsp                                ; 00400B61 _ 48: 89. E5
        mov     rax, rsi                                ; 00400B64 _ 48: 89. F0
        shr     rax, 63                                 ; 00400B67 _ 48: C1. E8, 3F
        add     rsi, rax                                ; 00400B6B _ 48: 01. C6
        sar     rsi, 1                                  ; 00400B6E _ 48: D1. FE
        jz      ?_053                                   ; 00400B71 _ 74, 15
        mov     eax, 0                                  ; 00400B73 _ B8, 00000000
        test    rax, rax                                ; 00400B78 _ 48: 85. C0
        jz      ?_053                                   ; 00400B7B _ 74, 0B
        pop     rbp                                     ; 00400B7D _ 5D
        mov     edi, 6308136                            ; 00400B7E _ BF, 00604128
        jmp     rax                                     ; 00400B83 _ FF. E0

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_053:  pop     rbp                                     ; 00400B88 _ 5D
        ret                                             ; 00400B89 _ C3

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

__do_global_dtors_aux:; Local function
        cmp     byte [rel completed.7585], 0            ; 00400B90 _ 80. 3D, 002035B1(rel), 00
        jnz     ?_054                                   ; 00400B97 _ 75, 11
        push    rbp                                     ; 00400B99 _ 55
        mov     rbp, rsp                                ; 00400B9A _ 48: 89. E5
        call    deregister_tm_clones                    ; 00400B9D _ E8, FFFFFF6E
        pop     rbp                                     ; 00400BA2 _ 5D
        mov     byte [rel completed.7585], 1            ; 00400BA3 _ C6. 05, 0020359E(rel), 01
?_054:  DB      0F3H                                    ; Prefix coded explicitly
        ret                                             ; 00400BAA _ F3: C3

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

frame_dummy:; Local function
        mov     edi, __JCR_LIST__                       ; 00400BB0 _ BF, 00603E20(d)
        cmp     qword [rdi], 0                          ; 00400BB5 _ 48: 83. 3F, 00
        jnz     ?_056                                   ; 00400BB9 _ 75, 05
?_055:  jmp     register_tm_clones                      ; 00400BBB _ EB, 93

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_056:  mov     eax, 0                                  ; 00400BC0 _ B8, 00000000
        test    rax, rax                                ; 00400BC5 _ 48: 85. C0
        jz      ?_055                                   ; 00400BC8 _ 74, F1
        push    rbp                                     ; 00400BCA _ 55
        mov     rbp, rsp                                ; 00400BCB _ 48: 89. E5
        call    rax                                     ; 00400BCE _ FF. D0
        pop     rbp                                     ; 00400BD0 _ 5D
        jmp     register_tm_clones                      ; 00400BD1 _ E9, FFFFFF7A

main:   ; Function begin
        push    rbp                                     ; 00400BD6 _ 55
        mov     rbp, rsp                                ; 00400BD7 _ 48: 89. E5
        mov     edi, ?_185                              ; 00400BDA _ BF, 00402C88(d)
        call    ?_007                                   ; 00400BDF _ E8, FFFFFD8C(rel)
        mov     eax, 0                                  ; 00400BE4 _ B8, 00000000
        call    SppRun                                  ; 00400BE9 _ E8, 00000007
        mov     eax, 0                                  ; 00400BEE _ B8, 00000000
        pop     rbp                                     ; 00400BF3 _ 5D
        ret                                             ; 00400BF4 _ C3
; main End of function

SppRun: ; Function begin
        push    rbp                                     ; 00400BF5 _ 55
        mov     rbp, rsp                                ; 00400BF6 _ 48: 89. E5
        sub     rsp, 144                                ; 00400BF9 _ 48: 81. EC, 00000090
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 00400C00 _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-8H], rax                     ; 00400C09 _ 48: 89. 45, F8
        xor     eax, eax                                ; 00400C0D _ 31. C0
        mov     dword [rbp-84H], 0                      ; 00400C0F _ C7. 85, FFFFFF7C, 00000000
        mov     qword [rbp-80H], 0                      ; 00400C19 _ 48: C7. 45, 80, 00000000
        mov     qword [rbp-78H], 0                      ; 00400C21 _ 48: C7. 45, 88, 00000000
        mov     qword [rbp-70H], 0                      ; 00400C29 _ 48: C7. 45, 90, 00000000
        mov     dword [rbp-60H], 0                      ; 00400C31 _ C7. 45, A0, 00000000
        mov     dword [rbp-5CH], 0                      ; 00400C38 _ C7. 45, A4, 00000000
        mov     qword [rbp-58H], 19279                  ; 00400C3F _ 48: C7. 45, A8, 00004B4F
        lea     rdx, [rbp-50H]                          ; 00400C47 _ 48: 8D. 55, B0
        mov     eax, 0                                  ; 00400C4B _ B8, 00000000
        mov     ecx, 7                                  ; 00400C50 _ B9, 00000007
        mov     rdi, rdx                                ; 00400C55 _ 48: 89. D7
        rep stosq                                       ; 00400C58 _ F3 48: AB
        mov     dword [rbp-18H], 0                      ; 00400C5B _ C7. 45, E8, 00000000
        mov     dword [rbp-14H], 0                      ; 00400C62 _ C7. 45, EC, 00000000
?_057:  lea     rdx, [rbp-60H]                          ; 00400C69 _ 48: 8D. 55, A0
        lea     rcx, [rbp-80H]                          ; 00400C6D _ 48: 8D. 4D, 80
        mov     eax, dword [rbp-84H]                    ; 00400C71 _ 8B. 85, FFFFFF7C
        mov     rsi, rcx                                ; 00400C77 _ 48: 89. CE
        mov     edi, eax                                ; 00400C7A _ 89. C7
        call    SppIterate                              ; 00400C7C _ E8, 0000003C
        mov     dword [rbp-84H], eax                    ; 00400C81 _ 89. 85, FFFFFF7C
        cmp     dword [rbp-84H], 7                      ; 00400C87 _ 83. BD, FFFFFF7C, 07
        jnz     ?_057                                   ; 00400C8E _ 75, D9
        lea     rdx, [rbp-60H]                          ; 00400C90 _ 48: 8D. 55, A0
        lea     rax, [rbp-80H]                          ; 00400C94 _ 48: 8D. 45, 80
        mov     rsi, rax                                ; 00400C98 _ 48: 89. C6
        mov     edi, 7                                  ; 00400C9B _ BF, 00000007
        call    SppIterate                              ; 00400CA0 _ E8, 00000018
        nop                                             ; 00400CA5 _ 90
        nop                                             ; 00400CA6 _ 90
        mov     rax, qword [rbp-8H]                     ; 00400CA7 _ 48: 8B. 45, F8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rax, qword [fs:abs 28H]                 ; 00400CAB _ 64 48: 33. 04 25, 00000028
        jz      ?_058                                   ; 00400CB4 _ 74, 05
        call    ?_013                                   ; 00400CB6 _ E8, FFFFFCE5(rel)
?_058:  leave                                           ; 00400CBB _ C9
        ret                                             ; 00400CBC _ C3
; SppRun End of function

SppIterate:; Function begin
        push    rbp                                     ; 00400CBD _ 55
        mov     rbp, rsp                                ; 00400CBE _ 48: 89. E5
        push    rbx                                     ; 00400CC1 _ 53
        sub     rsp, 104                                ; 00400CC2 _ 48: 83. EC, 68
        mov     dword [rbp-54H], edi                    ; 00400CC6 _ 89. 7D, AC
        mov     qword [rbp-60H], rsi                    ; 00400CC9 _ 48: 89. 75, A0
        mov     qword [rbp-68H], rdx                    ; 00400CCD _ 48: 89. 55, 98
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 00400CD1 _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-18H], rax                    ; 00400CDA _ 48: 89. 45, E8
        xor     eax, eax                                ; 00400CDE _ 31. C0
        mov     dword [rbp-40H], 7                      ; 00400CE0 _ C7. 45, C0, 00000007
        mov     rax, qword [rbp-68H]                    ; 00400CE7 _ 48: 8B. 45, 98
        mov     eax, dword [rax]                        ; 00400CEB _ 8B. 00
        test    eax, eax                                ; 00400CED _ 85. C0
        jz      ?_059                                   ; 00400CEF _ 74, 07
        mov     dword [rbp-54H], 5                      ; 00400CF1 _ C7. 45, AC, 00000005
?_059:  cmp     dword [rbp-54H], 7                      ; 00400CF8 _ 83. 7D, AC, 07
        ja      ?_090                                   ; 00400CFC _ 0F 87, 00000738
        mov     eax, dword [rbp-54H]                    ; 00400D02 _ 8B. 45, AC
; Note: Address is not rip-relative
        mov     rax, qword [abs ?_189+rax*8]            ; 00400D05 _ 48: 8B. 04 C5, 00402CC0(d)
        jmp     rax                                     ; 00400D0D _ FF. E0

?_060:  mov     edi, 81                                 ; 00400D0F _ BF, 00000051
        call    ?_035                                   ; 00400D14 _ E8, FFFFFD37(rel)
        mov     rdx, rax                                ; 00400D19 _ 48: 89. C2
        mov     rax, qword [rbp-60H]                    ; 00400D1C _ 48: 8B. 45, A0
        mov     qword [rax], rdx                        ; 00400D20 _ 48: 89. 10
        mov     rax, qword [rbp-60H]                    ; 00400D23 _ 48: 8B. 45, A0
        mov     rax, qword [rax]                        ; 00400D27 _ 48: 8B. 00
        add     rax, 80                                 ; 00400D2A _ 48: 83. C0, 50
        mov     byte [rax], 0                           ; 00400D2E _ C6. 00, 00
        mov     dword [rbp-40H], 1                      ; 00400D31 _ C7. 45, C0, 00000001
        jmp     ?_090                                   ; 00400D38 _ E9, 000006FD

?_061:  mov     rax, qword [rbp-68H]                    ; 00400D3D _ 48: 8B. 45, 98
        mov     rdi, rax                                ; 00400D41 _ 48: 89. C7
        call    HandleError                             ; 00400D44 _ E8, 00000BE3
        mov     rax, qword [rbp-68H]                    ; 00400D49 _ 48: 8B. 45, 98
        mov     eax, dword [rax+4CH]                    ; 00400D4D _ 8B. 40, 4C
        test    eax, eax                                ; 00400D50 _ 85. C0
        jz      ?_062                                   ; 00400D52 _ 74, 09
        mov     dword [rbp-40H], 7                      ; 00400D54 _ C7. 45, C0, 00000007
        jmp     ?_063                                   ; 00400D5B _ EB, 07

?_062:  mov     dword [rbp-40H], 1                      ; 00400D5D _ C7. 45, C0, 00000001
?_063:  mov     rax, qword [rbp-68H]                    ; 00400D64 _ 48: 8B. 45, 98
        mov     dword [rax], 0                          ; 00400D68 _ C7. 00, 00000000
        mov     rax, qword [rbp-68H]                    ; 00400D6E _ 48: 8B. 45, 98
        mov     dword [rax+4H], 0                       ; 00400D72 _ C7. 40, 04, 00000000
        mov     rax, qword [rbp-68H]                    ; 00400D79 _ 48: 8B. 45, 98
        mov     qword [rax+8H], 19279                   ; 00400D7D _ 48: C7. 40, 08, 00004B4F
        add     rax, 16                                 ; 00400D85 _ 48: 83. C0, 10
        mov     ecx, 56                                 ; 00400D89 _ B9, 00000038
        mov     esi, 0                                  ; 00400D8E _ BE, 00000000
        mov     qword [rax], rsi                        ; 00400D93 _ 48: 89. 30
        mov     edx, ecx                                ; 00400D96 _ 89. CA
        add     rdx, rax                                ; 00400D98 _ 48: 01. C2
        add     rdx, 8                                  ; 00400D9B _ 48: 83. C2, 08
        mov     qword [rdx-10H], rsi                    ; 00400D9F _ 48: 89. 72, F0
        lea     rdx, [rax+8H]                           ; 00400DA3 _ 48: 8D. 50, 08
        and     rdx, 0FFFFFFFFFFFFFFF8H                 ; 00400DA7 _ 48: 83. E2, F8
        sub     rax, rdx                                ; 00400DAB _ 48: 29. D0
        add     ecx, eax                                ; 00400DAE _ 01. C1
        and     ecx, 0FFFFFFF8H                         ; 00400DB0 _ 83. E1, F8
        mov     eax, ecx                                ; 00400DB3 _ 89. C8
        shr     eax, 3                                  ; 00400DB5 _ C1. E8, 03
        mov     ecx, eax                                ; 00400DB8 _ 89. C1
        mov     rdi, rdx                                ; 00400DBA _ 48: 89. D7
        mov     rax, rsi                                ; 00400DBD _ 48: 89. F0
        rep stosq                                       ; 00400DC0 _ F3 48: AB
        mov     rax, qword [rbp-68H]                    ; 00400DC3 _ 48: 8B. 45, 98
        mov     dword [rax+48H], 0                      ; 00400DC7 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-68H]                    ; 00400DCE _ 48: 8B. 45, 98
        mov     dword [rax+4CH], 0                      ; 00400DD2 _ C7. 40, 4C, 00000000
        jmp     ?_090                                   ; 00400DD9 _ E9, 0000065C

?_064:  mov     esi, ?_186                              ; 00400DDE _ BE, 00402CB2(d)
        mov     edi, ?_187                              ; 00400DE3 _ BF, 00402CB8(d)
        mov     eax, 0                                  ; 00400DE8 _ B8, 00000000
        call    ?_017                                   ; 00400DED _ E8, FFFFFBCE(rel)
        mov     rax, qword [rbp-60H]                    ; 00400DF2 _ 48: 8B. 45, A0
        mov     rax, qword [rax]                        ; 00400DF6 _ 48: 8B. 00
        mov     rdx, qword [rbp-68H]                    ; 00400DF9 _ 48: 8B. 55, 98
        mov     rsi, rdx                                ; 00400DFD _ 48: 89. D6
        mov     rdi, rax                                ; 00400E00 _ 48: 89. C7
        call    GrabLine                                ; 00400E03 _ E8, 00000650
        mov     dword [rbp-40H], 2                      ; 00400E08 _ C7. 45, C0, 00000002
        jmp     ?_090                                   ; 00400E0F _ E9, 00000626

?_065:  mov     dword [rbp-44H], 0                      ; 00400E14 _ C7. 45, BC, 00000000
        mov     rax, qword [rbp-60H]                    ; 00400E1B _ 48: 8B. 45, A0
        mov     rax, qword [rax]                        ; 00400E1F _ 48: 8B. 00
        mov     rdx, qword [rbp-68H]                    ; 00400E22 _ 48: 8B. 55, 98
        lea     rcx, [rbp-44H]                          ; 00400E26 _ 48: 8D. 4D, BC
        mov     rsi, rcx                                ; 00400E2A _ 48: 89. CE
        mov     rdi, rax                                ; 00400E2D _ 48: 89. C7
        call    CheckSyntax                             ; 00400E30 _ E8, 0000074A
        mov     eax, dword [rbp-44H]                    ; 00400E35 _ 8B. 45, BC
        test    eax, eax                                ; 00400E38 _ 85. C0
        jnz     ?_066                                   ; 00400E3A _ 75, 0C
        mov     dword [rbp-40H], 3                      ; 00400E3C _ C7. 45, C0, 00000003
        jmp     ?_090                                   ; 00400E43 _ E9, 000005F2

?_066:  mov     eax, dword [rbp-44H]                    ; 00400E48 _ 8B. 45, BC
        cmp     eax, 1                                  ; 00400E4B _ 83. F8, 01
        jnz     ?_067                                   ; 00400E4E _ 75, 0C
        mov     dword [rbp-40H], 1                      ; 00400E50 _ C7. 45, C0, 00000001
        jmp     ?_090                                   ; 00400E57 _ E9, 000005DE

?_067:  mov     dword [rbp-40H], 5                      ; 00400E5C _ C7. 45, C0, 00000005
        jmp     ?_090                                   ; 00400E63 _ E9, 000005D2

?_068:  mov     rax, qword [rbp-60H]                    ; 00400E68 _ 48: 8B. 45, A0
        mov     rax, qword [rax]                        ; 00400E6C _ 48: 8B. 00
        mov     esi, ?_184                              ; 00400E6F _ BE, 00402C78(d)
        mov     rdi, rax                                ; 00400E74 _ 48: 89. C7
        call    ?_031                                   ; 00400E77 _ E8, FFFFFBB4(rel)
        test    eax, eax                                ; 00400E7C _ 85. C0
        jnz     ?_069                                   ; 00400E7E _ 75, 0C
        mov     dword [rbp-40H], 7                      ; 00400E80 _ C7. 45, C0, 00000007
        jmp     ?_090                                   ; 00400E87 _ E9, 000005AE

?_069:  mov     dword [rbp-3CH], 0                      ; 00400E8C _ C7. 45, C4, 00000000
        mov     dword [rbp-38H], 0                      ; 00400E93 _ C7. 45, C8, 00000000
        mov     esi, 48                                 ; 00400E9A _ BE, 00000030
        mov     edi, 11                                 ; 00400E9F _ BF, 0000000B
        call    ?_029                                   ; 00400EA4 _ E8, FFFFFB77(rel)
        mov     rdx, rax                                ; 00400EA9 _ 48: 89. C2
        mov     rax, qword [rbp-60H]                    ; 00400EAC _ 48: 8B. 45, A0
        mov     qword [rax+8H], rdx                     ; 00400EB0 _ 48: 89. 50, 08
        mov     dword [rbp-38H], 0                      ; 00400EB4 _ C7. 45, C8, 00000000
        jmp     ?_071                                   ; 00400EBB _ E9, 000000C1

?_070:  mov     rax, qword [rbp-60H]                    ; 00400EC0 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 00400EC4 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-38H]                    ; 00400EC8 _ 8B. 45, C8
        movsxd  rdx, eax                                ; 00400ECB _ 48: 63. D0
        mov     rax, rdx                                ; 00400ECE _ 48: 89. D0
        add     rax, rax                                ; 00400ED1 _ 48: 01. C0
        add     rax, rdx                                ; 00400ED4 _ 48: 01. D0
        shl     rax, 4                                  ; 00400ED7 _ 48: C1. E0, 04
        lea     rbx, [rcx+rax]                          ; 00400EDB _ 48: 8D. 1C 01
        mov     esi, 1                                  ; 00400EDF _ BE, 00000001
        mov     edi, 81                                 ; 00400EE4 _ BF, 00000051
        call    ?_029                                   ; 00400EE9 _ E8, FFFFFB32(rel)
        mov     qword [rbx+28H], rax                    ; 00400EEE _ 48: 89. 43, 28
        mov     rax, qword [rbp-60H]                    ; 00400EF2 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 00400EF6 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-38H]                    ; 00400EFA _ 8B. 45, C8
        movsxd  rdx, eax                                ; 00400EFD _ 48: 63. D0
        mov     rax, rdx                                ; 00400F00 _ 48: 89. D0
        add     rax, rax                                ; 00400F03 _ 48: 01. C0
        add     rax, rdx                                ; 00400F06 _ 48: 01. D0
        shl     rax, 4                                  ; 00400F09 _ 48: C1. E0, 04
        lea     rbx, [rcx+rax]                          ; 00400F0D _ 48: 8D. 1C 01
        mov     esi, 1                                  ; 00400F11 _ BE, 00000001
        mov     edi, 81                                 ; 00400F16 _ BF, 00000051
        call    ?_029                                   ; 00400F1B _ E8, FFFFFB00(rel)
        mov     qword [rbx+20H], rax                    ; 00400F20 _ 48: 89. 43, 20
        mov     rax, qword [rbp-60H]                    ; 00400F24 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 00400F28 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-38H]                    ; 00400F2C _ 8B. 45, C8
        movsxd  rdx, eax                                ; 00400F2F _ 48: 63. D0
        mov     rax, rdx                                ; 00400F32 _ 48: 89. D0
        add     rax, rax                                ; 00400F35 _ 48: 01. C0
        add     rax, rdx                                ; 00400F38 _ 48: 01. D0
        shl     rax, 4                                  ; 00400F3B _ 48: C1. E0, 04
        lea     rbx, [rcx+rax]                          ; 00400F3F _ 48: 8D. 1C 01
        mov     edi, 81                                 ; 00400F43 _ BF, 00000051
        call    ?_035                                   ; 00400F48 _ E8, FFFFFB03(rel)
        mov     qword [rbx], rax                        ; 00400F4D _ 48: 89. 03
        mov     rax, qword [rbp-60H]                    ; 00400F50 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 00400F54 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-38H]                    ; 00400F58 _ 8B. 45, C8
        movsxd  rdx, eax                                ; 00400F5B _ 48: 63. D0
        mov     rax, rdx                                ; 00400F5E _ 48: 89. D0
        add     rax, rax                                ; 00400F61 _ 48: 01. C0
        add     rax, rdx                                ; 00400F64 _ 48: 01. D0
        shl     rax, 4                                  ; 00400F67 _ 48: C1. E0, 04
        lea     rbx, [rcx+rax]                          ; 00400F6B _ 48: 8D. 1C 01
        mov     edi, 65                                 ; 00400F6F _ BF, 00000041
        call    ?_035                                   ; 00400F74 _ E8, FFFFFAD7(rel)
        mov     qword [rbx+8H], rax                     ; 00400F79 _ 48: 89. 43, 08
        add     dword [rbp-38H], 1                      ; 00400F7D _ 83. 45, C8, 01
?_071:  cmp     dword [rbp-38H], 9                      ; 00400F81 _ 83. 7D, C8, 09
        jle     ?_070                                   ; 00400F85 _ 0F 8E, FFFFFF35
        mov     rax, qword [rbp-60H]                    ; 00400F8B _ 48: 8B. 45, A0
        mov     rax, qword [rax]                        ; 00400F8F _ 48: 8B. 00
        mov     esi, ?_188                              ; 00400F92 _ BE, 00402CBB(d)
        mov     rdi, rax                                ; 00400F97 _ 48: 89. C7
        call    ?_043                                   ; 00400F9A _ E8, FFFFFAF1(rel)
        mov     qword [rbp-20H], rax                    ; 00400F9F _ 48: 89. 45, E0
        mov     dword [rbp-3CH], 0                      ; 00400FA3 _ C7. 45, C4, 00000000
        jmp     ?_073                                   ; 00400FAA _ EB, 47

?_072:  mov     rax, qword [rbp-60H]                    ; 00400FAC _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 00400FB0 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-3CH]                    ; 00400FB4 _ 8B. 45, C4
        movsxd  rdx, eax                                ; 00400FB7 _ 48: 63. D0
        mov     rax, rdx                                ; 00400FBA _ 48: 89. D0
        add     rax, rax                                ; 00400FBD _ 48: 01. C0
        add     rax, rdx                                ; 00400FC0 _ 48: 01. D0
        shl     rax, 4                                  ; 00400FC3 _ 48: C1. E0, 04
        add     rax, rcx                                ; 00400FC7 _ 48: 01. C8
        mov     rax, qword [rax]                        ; 00400FCA _ 48: 8B. 00
        mov     rdx, qword [rbp-20H]                    ; 00400FCD _ 48: 8B. 55, E0
        mov     rsi, rdx                                ; 00400FD1 _ 48: 89. D6
        mov     rdi, rax                                ; 00400FD4 _ 48: 89. C7
        call    ?_005                                   ; 00400FD7 _ E8, FFFFF984(rel)
        add     dword [rbp-3CH], 1                      ; 00400FDC _ 83. 45, C4, 01
        mov     esi, ?_188                              ; 00400FE0 _ BE, 00402CBB(d)
        mov     edi, 0                                  ; 00400FE5 _ BF, 00000000
        call    ?_043                                   ; 00400FEA _ E8, FFFFFAA1(rel)
        mov     qword [rbp-20H], rax                    ; 00400FEF _ 48: 89. 45, E0
?_073:  cmp     qword [rbp-20H], 0                      ; 00400FF3 _ 48: 83. 7D, E0, 00
        jnz     ?_072                                   ; 00400FF8 _ 75, B2
        mov     rax, qword [rbp-60H]                    ; 00400FFA _ 48: 8B. 45, A0
        mov     edx, dword [rbp-3CH]                    ; 00400FFE _ 8B. 55, C4
        mov     dword [rax+10H], edx                    ; 00401001 _ 89. 50, 10
        mov     rdx, qword [rbp-68H]                    ; 00401004 _ 48: 8B. 55, 98
        mov     rax, qword [rbp-60H]                    ; 00401008 _ 48: 8B. 45, A0
        mov     rsi, rdx                                ; 0040100C _ 48: 89. D6
        mov     rdi, rax                                ; 0040100F _ 48: 89. C7
        call    ExtractCmds                             ; 00401012 _ E8, 00000965
        mov     rax, qword [rbp-60H]                    ; 00401017 _ 48: 8B. 45, A0
        mov     rdi, rax                                ; 0040101B _ 48: 89. C7
        call    DebugPrintCommands                      ; 0040101E _ E8, 00000C9F
        mov     rdx, qword [rbp-68H]                    ; 00401023 _ 48: 8B. 55, 98
        mov     rax, qword [rbp-60H]                    ; 00401027 _ 48: 8B. 45, A0
        mov     rsi, rdx                                ; 0040102B _ 48: 89. D6
        mov     rdi, rax                                ; 0040102E _ 48: 89. C7
        call    CheckPipingRules                        ; 00401031 _ E8, 000016CA
        mov     dword [rbp-40H], 4                      ; 00401036 _ C7. 45, C0, 00000004
        jmp     ?_090                                   ; 0040103D _ E9, 000003F8

?_074:  mov     dword [rbp-34H], 0                      ; 00401042 _ C7. 45, CC, 00000000
        jmp     ?_078                                   ; 00401049 _ E9, 000000BB

?_075:  mov     dword [rbp-30H], 0                      ; 0040104E _ C7. 45, D0, 00000000
        jmp     ?_077                                   ; 00401055 _ EB, 3E

?_076:  mov     rax, qword [rbp-60H]                    ; 00401057 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 0040105B _ 48: 8B. 48, 08
        mov     eax, dword [rbp-34H]                    ; 0040105F _ 8B. 45, CC
        movsxd  rdx, eax                                ; 00401062 _ 48: 63. D0
        mov     rax, rdx                                ; 00401065 _ 48: 89. D0
        add     rax, rax                                ; 00401068 _ 48: 01. C0
        add     rax, rdx                                ; 0040106B _ 48: 01. D0
        shl     rax, 4                                  ; 0040106E _ 48: C1. E0, 04
        add     rax, rcx                                ; 00401072 _ 48: 01. C8
        mov     rax, qword [rax+8H]                     ; 00401075 _ 48: 8B. 40, 08
        mov     edx, dword [rbp-30H]                    ; 00401079 _ 8B. 55, D0
        movsxd  rdx, edx                                ; 0040107C _ 48: 63. D2
        shl     rdx, 3                                  ; 0040107F _ 48: C1. E2, 03
        add     rax, rdx                                ; 00401083 _ 48: 01. D0
        mov     rax, qword [rax]                        ; 00401086 _ 48: 8B. 00
        mov     rdi, rax                                ; 00401089 _ 48: 89. C7
        call    ?_003                                   ; 0040108C _ E8, FFFFF8BF(rel)
        add     dword [rbp-30H], 1                      ; 00401091 _ 83. 45, D0, 01
?_077:  mov     rax, qword [rbp-60H]                    ; 00401095 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 00401099 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-34H]                    ; 0040109D _ 8B. 45, CC
        movsxd  rdx, eax                                ; 004010A0 _ 48: 63. D0
        mov     rax, rdx                                ; 004010A3 _ 48: 89. D0
        add     rax, rax                                ; 004010A6 _ 48: 01. C0
        add     rax, rdx                                ; 004010A9 _ 48: 01. D0
        shl     rax, 4                                  ; 004010AC _ 48: C1. E0, 04
        add     rax, rcx                                ; 004010B0 _ 48: 01. C8
        mov     eax, dword [rax+10H]                    ; 004010B3 _ 8B. 40, 10
        cmp     eax, dword [rbp-30H]                    ; 004010B6 _ 3B. 45, D0
        jg      ?_076                                   ; 004010B9 _ 7F, 9C
        mov     rax, qword [rbp-60H]                    ; 004010BB _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 004010BF _ 48: 8B. 48, 08
        mov     eax, dword [rbp-34H]                    ; 004010C3 _ 8B. 45, CC
        movsxd  rdx, eax                                ; 004010C6 _ 48: 63. D0
        mov     rax, rdx                                ; 004010C9 _ 48: 89. D0
        add     rax, rax                                ; 004010CC _ 48: 01. C0
        add     rax, rdx                                ; 004010CF _ 48: 01. D0
        shl     rax, 4                                  ; 004010D2 _ 48: C1. E0, 04
        add     rax, rcx                                ; 004010D6 _ 48: 01. C8
        mov     dword [rax+14H], 0                      ; 004010D9 _ C7. 40, 14, 00000000
        mov     rax, qword [rbp-60H]                    ; 004010E0 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 004010E4 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-34H]                    ; 004010E8 _ 8B. 45, CC
        movsxd  rdx, eax                                ; 004010EB _ 48: 63. D0
        mov     rax, rdx                                ; 004010EE _ 48: 89. D0
        add     rax, rax                                ; 004010F1 _ 48: 01. C0
        add     rax, rdx                                ; 004010F4 _ 48: 01. D0
        shl     rax, 4                                  ; 004010F7 _ 48: C1. E0, 04
        add     rax, rcx                                ; 004010FB _ 48: 01. C8
        mov     dword [rax+18H], 0                      ; 004010FE _ C7. 40, 18, 00000000
        add     dword [rbp-34H], 1                      ; 00401105 _ 83. 45, CC, 01
?_078:  mov     rax, qword [rbp-60H]                    ; 00401109 _ 48: 8B. 45, A0
        mov     eax, dword [rax+10H]                    ; 0040110D _ 8B. 40, 10
        cmp     eax, dword [rbp-34H]                    ; 00401110 _ 3B. 45, CC
        jg      ?_075                                   ; 00401113 _ 0F 8F, FFFFFF35
        mov     dword [rbp-34H], 0                      ; 00401119 _ C7. 45, CC, 00000000
        mov     dword [rbp-34H], 0                      ; 00401120 _ C7. 45, CC, 00000000
        jmp     ?_080                                   ; 00401127 _ E9, 000000AB

?_079:  mov     rax, qword [rbp-60H]                    ; 0040112C _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 00401130 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-34H]                    ; 00401134 _ 8B. 45, CC
        movsxd  rdx, eax                                ; 00401137 _ 48: 63. D0
        mov     rax, rdx                                ; 0040113A _ 48: 89. D0
        add     rax, rax                                ; 0040113D _ 48: 01. C0
        add     rax, rdx                                ; 00401140 _ 48: 01. D0
        shl     rax, 4                                  ; 00401143 _ 48: C1. E0, 04
        add     rax, rcx                                ; 00401147 _ 48: 01. C8
        mov     rax, qword [rax+28H]                    ; 0040114A _ 48: 8B. 40, 28
        mov     rdi, rax                                ; 0040114E _ 48: 89. C7
        call    ?_003                                   ; 00401151 _ E8, FFFFF7FA(rel)
        mov     rax, qword [rbp-60H]                    ; 00401156 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 0040115A _ 48: 8B. 48, 08
        mov     eax, dword [rbp-34H]                    ; 0040115E _ 8B. 45, CC
        movsxd  rdx, eax                                ; 00401161 _ 48: 63. D0
        mov     rax, rdx                                ; 00401164 _ 48: 89. D0
        add     rax, rax                                ; 00401167 _ 48: 01. C0
        add     rax, rdx                                ; 0040116A _ 48: 01. D0
        shl     rax, 4                                  ; 0040116D _ 48: C1. E0, 04
        add     rax, rcx                                ; 00401171 _ 48: 01. C8
        mov     rax, qword [rax+20H]                    ; 00401174 _ 48: 8B. 40, 20
        mov     rdi, rax                                ; 00401178 _ 48: 89. C7
        call    ?_003                                   ; 0040117B _ E8, FFFFF7D0(rel)
        mov     rax, qword [rbp-60H]                    ; 00401180 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 00401184 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-34H]                    ; 00401188 _ 8B. 45, CC
        movsxd  rdx, eax                                ; 0040118B _ 48: 63. D0
        mov     rax, rdx                                ; 0040118E _ 48: 89. D0
        add     rax, rax                                ; 00401191 _ 48: 01. C0
        add     rax, rdx                                ; 00401194 _ 48: 01. D0
        shl     rax, 4                                  ; 00401197 _ 48: C1. E0, 04
        add     rax, rcx                                ; 0040119B _ 48: 01. C8
        mov     rax, qword [rax]                        ; 0040119E _ 48: 8B. 00
        mov     rdi, rax                                ; 004011A1 _ 48: 89. C7
        call    ?_003                                   ; 004011A4 _ E8, FFFFF7A7(rel)
        mov     rax, qword [rbp-60H]                    ; 004011A9 _ 48: 8B. 45, A0
        mov     rcx, qword [rax+8H]                     ; 004011AD _ 48: 8B. 48, 08
        mov     eax, dword [rbp-34H]                    ; 004011B1 _ 8B. 45, CC
        movsxd  rdx, eax                                ; 004011B4 _ 48: 63. D0
        mov     rax, rdx                                ; 004011B7 _ 48: 89. D0
        add     rax, rax                                ; 004011BA _ 48: 01. C0
        add     rax, rdx                                ; 004011BD _ 48: 01. D0
        shl     rax, 4                                  ; 004011C0 _ 48: C1. E0, 04
        add     rax, rcx                                ; 004011C4 _ 48: 01. C8
        mov     rax, qword [rax+8H]                     ; 004011C7 _ 48: 8B. 40, 08
        mov     rdi, rax                                ; 004011CB _ 48: 89. C7
        call    ?_003                                   ; 004011CE _ E8, FFFFF77D(rel)
        add     dword [rbp-34H], 1                      ; 004011D3 _ 83. 45, CC, 01
?_080:  cmp     dword [rbp-34H], 10                     ; 004011D7 _ 83. 7D, CC, 0A
        jle     ?_079                                   ; 004011DB _ 0F 8E, FFFFFF4B
        mov     rax, qword [rbp-60H]                    ; 004011E1 _ 48: 8B. 45, A0
        mov     dword [rax+10H], 0                      ; 004011E5 _ C7. 40, 10, 00000000
        mov     rax, qword [rbp-60H]                    ; 004011EC _ 48: 8B. 45, A0
        mov     rax, qword [rax+8H]                     ; 004011F0 _ 48: 8B. 40, 08
        mov     rdi, rax                                ; 004011F4 _ 48: 89. C7
        call    ?_003                                   ; 004011F7 _ E8, FFFFF754(rel)
        mov     dword [rbp-40H], 1                      ; 004011FC _ C7. 45, C0, 00000001
        jmp     ?_090                                   ; 00401203 _ E9, 00000232

?_081:  mov     dword [rbp-2CH], 0                      ; 00401208 _ C7. 45, D4, 00000000
        jmp     ?_084                                   ; 0040120F _ EB, 51

?_082:  mov     eax, dword [rbp-2CH]                    ; 00401211 _ 8B. 45, D4
        cdqe                                            ; 00401214 _ 48: 98
; Note: Address is not rip-relative
        mov     rdx, qword [abs sppcommand_strings+rax*8]; 00401216 _ 48: 8B. 14 C5, 006040F0(d)
        mov     rax, qword [rbp-60H]                    ; 0040121E _ 48: 8B. 45, A0
        mov     rax, qword [rax+8H]                     ; 00401222 _ 48: 8B. 40, 08
        mov     rax, qword [rax+8H]                     ; 00401226 _ 48: 8B. 40, 08
        mov     rax, qword [rax]                        ; 0040122A _ 48: 8B. 00
        mov     rsi, rdx                                ; 0040122D _ 48: 89. D6
        mov     rdi, rax                                ; 00401230 _ 48: 89. C7
        call    ?_031                                   ; 00401233 _ E8, FFFFF7F8(rel)
        mov     dword [rbp-28H], eax                    ; 00401238 _ 89. 45, D8
        cmp     dword [rbp-28H], 0                      ; 0040123B _ 83. 7D, D8, 00
        jnz     ?_083                                   ; 0040123F _ 75, 1D
        mov     eax, dword [rbp-2CH]                    ; 00401241 _ 8B. 45, D4
        cdqe                                            ; 00401244 _ 48: 98
; Note: Address is not rip-relative
        mov     rax, qword [abs SppCommands+rax*8]      ; 00401246 _ 48: 8B. 04 C5, 00604110(d)
        mov     rcx, qword [rbp-68H]                    ; 0040124E _ 48: 8B. 4D, 98
        mov     rdx, qword [rbp-60H]                    ; 00401252 _ 48: 8B. 55, A0
        mov     rsi, rcx                                ; 00401256 _ 48: 89. CE
        mov     rdi, rdx                                ; 00401259 _ 48: 89. D7
        call    rax                                     ; 0040125C _ FF. D0
?_083:  add     dword [rbp-2CH], 1                      ; 0040125E _ 83. 45, D4, 01
?_084:  cmp     dword [rbp-2CH], 2                      ; 00401262 _ 83. 7D, D4, 02
        jle     ?_082                                   ; 00401266 _ 7E, A9
        mov     rax, qword [rbp-60H]                    ; 00401268 _ 48: 8B. 45, A0
        mov     eax, dword [rax+10H]                    ; 0040126C _ 8B. 40, 10
        cmp     eax, 1                                  ; 0040126F _ 83. F8, 01
        jle     ?_085                                   ; 00401272 _ 7E, 23
        mov     rax, qword [rbp-60H]                    ; 00401274 _ 48: 8B. 45, A0
        mov     edx, dword [rax+10H]                    ; 00401278 _ 8B. 50, 10
        mov     rsi, qword [rbp-68H]                    ; 0040127B _ 48: 8B. 75, 98
        mov     rax, qword [rbp-60H]                    ; 0040127F _ 48: 8B. 45, A0
        mov     ecx, edx                                ; 00401283 _ 89. D1
        mov     edx, 0                                  ; 00401285 _ BA, 00000000
        mov     rdi, rax                                ; 0040128A _ 48: 89. C7
        call    SetUpAndExecute                         ; 0040128D _ E8, 00000CD0
        jmp     ?_088                                   ; 00401292 _ E9, 0000018A

?_085:  call    ?_049                                   ; 00401297 _ E8, FFFFF824(rel)
        mov     dword [rbp-24H], eax                    ; 0040129C _ 89. 45, DC
        cmp     dword [rbp-24H], 0                      ; 0040129F _ 83. 7D, DC, 00
        jz      ?_086                                   ; 004012A3 _ 74, 1B
        lea     rcx, [rbp-44H]                          ; 004012A5 _ 48: 8D. 4D, BC
        mov     eax, dword [rbp-24H]                    ; 004012A9 _ 8B. 45, DC
        mov     edx, 0                                  ; 004012AC _ BA, 00000000
        mov     rsi, rcx                                ; 004012B1 _ 48: 89. CE
        mov     edi, eax                                ; 004012B4 _ 89. C7
        call    ?_039                                   ; 004012B6 _ E8, FFFFF7B5(rel)
        jmp     ?_088                                   ; 004012BB _ E9, 00000161

?_086:  cmp     dword [rbp-24H], 0                      ; 004012C0 _ 83. 7D, DC, 00
        jns     ?_087                                   ; 004012C4 _ 0F 89, 00000088
        mov     rax, qword [rbp-68H]                    ; 004012CA _ 48: 8B. 45, 98
        mov     dword [rax], 1                          ; 004012CE _ C7. 00, 00000001
        mov     rax, qword [rbp-68H]                    ; 004012D4 _ 48: 8B. 45, 98
        mov     dword [rax+4H], 201                     ; 004012D8 _ C7. 40, 04, 000000C9
        mov     rax, qword [rbp-68H]                    ; 004012DF _ 48: 8B. 45, 98
        mov     rbx, qword 696166206B726F46H            ; 004012E3 _ 48: BB, 696166206B726F46
        mov     qword [rax+8H], rbx                     ; 004012ED _ 48: 89. 58, 08
        mov     qword [rax+10H], 778331500              ; 004012F1 _ 48: C7. 40, 10, 2E64656C
        add     rax, 24                                 ; 004012F9 _ 48: 83. C0, 18
        mov     ecx, 48                                 ; 004012FD _ B9, 00000030
        mov     esi, 0                                  ; 00401302 _ BE, 00000000
        mov     qword [rax], rsi                        ; 00401307 _ 48: 89. 30
        mov     edx, ecx                                ; 0040130A _ 89. CA
        add     rdx, rax                                ; 0040130C _ 48: 01. C2
        add     rdx, 8                                  ; 0040130F _ 48: 83. C2, 08
        mov     qword [rdx-10H], rsi                    ; 00401313 _ 48: 89. 72, F0
        lea     rdx, [rax+8H]                           ; 00401317 _ 48: 8D. 50, 08
        and     rdx, 0FFFFFFFFFFFFFFF8H                 ; 0040131B _ 48: 83. E2, F8
        sub     rax, rdx                                ; 0040131F _ 48: 29. D0
        add     ecx, eax                                ; 00401322 _ 01. C1
        and     ecx, 0FFFFFFF8H                         ; 00401324 _ 83. E1, F8
        mov     eax, ecx                                ; 00401327 _ 89. C8
        shr     eax, 3                                  ; 00401329 _ C1. E8, 03
        mov     ecx, eax                                ; 0040132C _ 89. C1
        mov     rdi, rdx                                ; 0040132E _ 48: 89. D7
        mov     rax, rsi                                ; 00401331 _ 48: 89. F0
        rep stosq                                       ; 00401334 _ F3 48: AB
        mov     rax, qword [rbp-68H]                    ; 00401337 _ 48: 8B. 45, 98
        mov     dword [rax+48H], 0                      ; 0040133B _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-68H]                    ; 00401342 _ 48: 8B. 45, 98
        mov     dword [rax+4CH], 0                      ; 00401346 _ C7. 40, 4C, 00000000
        jmp     ?_088                                   ; 0040134D _ E9, 000000CF

?_087:  mov     rcx, qword [rbp-68H]                    ; 00401352 _ 48: 8B. 4D, 98
        mov     rax, qword [rbp-60H]                    ; 00401356 _ 48: 8B. 45, A0
        mov     edx, 0                                  ; 0040135A _ BA, 00000000
        mov     rsi, rcx                                ; 0040135F _ 48: 89. CE
        mov     rdi, rax                                ; 00401362 _ 48: 89. C7
        call    SetRedirs                               ; 00401365 _ E8, 000009D5
        mov     rax, qword [rbp-60H]                    ; 0040136A _ 48: 8B. 45, A0
        mov     rax, qword [rax+8H]                     ; 0040136E _ 48: 8B. 40, 08
        mov     rdx, qword [rax+8H]                     ; 00401372 _ 48: 8B. 50, 08
        mov     rax, qword [rbp-60H]                    ; 00401376 _ 48: 8B. 45, A0
        mov     rax, qword [rax+8H]                     ; 0040137A _ 48: 8B. 40, 08
        mov     rax, qword [rax+8H]                     ; 0040137E _ 48: 8B. 40, 08
        mov     rax, qword [rax]                        ; 00401382 _ 48: 8B. 00
        mov     rsi, rdx                                ; 00401385 _ 48: 89. D6
        mov     rdi, rax                                ; 00401388 _ 48: 89. C7
        call    ?_045                                   ; 0040138B _ E8, FFFFF710(rel)
        mov     rax, qword [rbp-68H]                    ; 00401390 _ 48: 8B. 45, 98
        mov     dword [rax], 1                          ; 00401394 _ C7. 00, 00000001
        mov     rax, qword [rbp-68H]                    ; 0040139A _ 48: 8B. 45, 98
        mov     dword [rax+4H], 202                     ; 0040139E _ C7. 40, 04, 000000CA
        mov     rax, qword [rbp-68H]                    ; 004013A5 _ 48: 8B. 45, 98
        mov     rbx, qword 6620746567726154H            ; 004013A9 _ 48: BB, 6620746567726154
        mov     qword [rax+8H], rbx                     ; 004013B3 _ 48: 89. 58, 08
        mov     rbx, qword 206E6F6974636E75H            ; 004013B7 _ 48: BB, 206E6F6974636E75
        mov     qword [rax+10H], rbx                    ; 004013C1 _ 48: 89. 58, 10
        mov     rbx, qword 742064656C696166H            ; 004013C5 _ 48: BB, 742064656C696166
        mov     qword [rax+18H], rbx                    ; 004013CF _ 48: 89. 58, 18
        mov     rbx, qword 747563657865206FH            ; 004013D3 _ 48: BB, 747563657865206F
        mov     qword [rax+20H], rbx                    ; 004013DD _ 48: 89. 58, 20
        mov     qword [rax+28H], 11877                  ; 004013E1 _ 48: C7. 40, 28, 00002E65
        mov     qword [rax+30H], 0                      ; 004013E9 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 004013F1 _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 004013F9 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-68H]                    ; 00401401 _ 48: 8B. 45, 98
        mov     dword [rax+48H], 0                      ; 00401405 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-68H]                    ; 0040140C _ 48: 8B. 45, 98
        mov     dword [rax+4CH], 0                      ; 00401410 _ C7. 40, 4C, 00000000
        mov     edi, 1                                  ; 00401417 _ BF, 00000001
        call    ?_047                                   ; 0040141C _ E8, FFFFF68F(rel)
?_088:  mov     dword [rbp-40H], 6                      ; 00401421 _ C7. 45, C0, 00000006
        jmp     ?_090                                   ; 00401428 _ EB, 10

?_089:  mov     rax, qword [rbp-60H]                    ; 0040142A _ 48: 8B. 45, A0
        mov     rax, qword [rax]                        ; 0040142E _ 48: 8B. 00
        mov     rdi, rax                                ; 00401431 _ 48: 89. C7
        call    ?_003                                   ; 00401434 _ E8, FFFFF517(rel)
        nop                                             ; 00401439 _ 90
?_090:  mov     eax, dword [rbp-40H]                    ; 0040143A _ 8B. 45, C0
        mov     rbx, qword [rbp-18H]                    ; 0040143D _ 48: 8B. 5D, E8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rbx, qword [fs:abs 28H]                 ; 00401441 _ 64 48: 33. 1C 25, 00000028
        jz      ?_091                                   ; 0040144A _ 74, 05
        call    ?_013                                   ; 0040144C _ E8, FFFFF54F(rel)
?_091:  add     rsp, 104                                ; 00401451 _ 48: 83. C4, 68
        pop     rbx                                     ; 00401455 _ 5B
        pop     rbp                                     ; 00401456 _ 5D
        ret                                             ; 00401457 _ C3
; SppIterate End of function

GrabLine:; Function begin
        push    rbp                                     ; 00401458 _ 55
        mov     rbp, rsp                                ; 00401459 _ 48: 89. E5
        sub     rsp, 48                                 ; 0040145C _ 48: 83. EC, 30
        mov     qword [rbp-28H], rdi                    ; 00401460 _ 48: 89. 7D, D8
        mov     qword [rbp-30H], rsi                    ; 00401464 _ 48: 89. 75, D0
        mov     rax, qword [rbp-30H]                    ; 00401468 _ 48: 8B. 45, D0
        mov     eax, dword [rax]                        ; 0040146C _ 8B. 00
        test    eax, eax                                ; 0040146E _ 85. C0
        jne     ?_097                                   ; 00401470 _ 0F 85, 00000103
        mov     rax, qword [rbp-28H]                    ; 00401476 _ 48: 8B. 45, D8
        mov     qword [rbp-8H], rax                     ; 0040147A _ 48: 89. 45, F8
        mov     dword [rbp-18H], 0                      ; 0040147E _ C7. 45, E8, 00000000
        mov     dword [rbp-14H], 0                      ; 00401485 _ C7. 45, EC, 00000000
        mov     dword [rbp-10H], 0                      ; 0040148C _ C7. 45, F0, 00000000
?_092:  mov     rax, qword [rel stdin]                  ; 00401493 _ 48: 8B. 05, 00202CA6(rel)
        mov     rdi, rax                                ; 0040149A _ 48: 89. C7
        call    ?_019                                   ; 0040149D _ E8, FFFFF52E(rel)
        mov     byte [rbp-19H], al                      ; 004014A2 _ 88. 45, E7
        cmp     byte [rbp-19H], 10                      ; 004014A5 _ 80. 7D, E7, 0A
        jz      ?_093                                   ; 004014A9 _ 74, 1B
        mov     rax, qword [rbp-8H]                     ; 004014AB _ 48: 8B. 45, F8
        movzx   edx, byte [rbp-19H]                     ; 004014AF _ 0F B6. 55, E7
        mov     byte [rax], dl                          ; 004014B3 _ 88. 10
        add     qword [rbp-8H], 1                       ; 004014B5 _ 48: 83. 45, F8, 01
        add     dword [rbp-18H], 1                      ; 004014BA _ 83. 45, E8, 01
        cmp     dword [rbp-18H], 80                     ; 004014BE _ 83. 7D, E8, 50
        jle     ?_092                                   ; 004014C2 _ 7E, CF
        jmp     ?_094                                   ; 004014C4 _ EB, 0C

?_093:  mov     rax, qword [rbp-8H]                     ; 004014C6 _ 48: 8B. 45, F8
        mov     byte [rax], 0                           ; 004014CA _ C6. 00, 00
        jmp     ?_099                                   ; 004014CD _ E9, 000000AB

?_094:  mov     dword [rbp-14H], 1                      ; 004014D2 _ C7. 45, EC, 00000001
        mov     rax, qword [rbp-30H]                    ; 004014D9 _ 48: 8B. 45, D0
        mov     dword [rax], 1                          ; 004014DD _ C7. 00, 00000001
        mov     rax, qword [rbp-30H]                    ; 004014E3 _ 48: 8B. 45, D0
        mov     dword [rax+4H], 101                     ; 004014E7 _ C7. 40, 04, 00000065
        mov     rax, qword [rbp-30H]                    ; 004014EE _ 48: 8B. 45, D0
        mov     rcx, qword 61686320656E694CH            ; 004014F2 _ 48: B9, 61686320656E694C
        mov     qword [rax+8H], rcx                     ; 004014FC _ 48: 89. 48, 08
        mov     rsi, qword 6C20726574636172H            ; 00401500 _ 48: BE, 6C20726574636172
        mov     qword [rax+10H], rsi                    ; 0040150A _ 48: 89. 70, 10
        mov     rdx, qword 6378652074696D69H            ; 0040150E _ 48: BA, 6378652074696D69
        mov     qword [rax+18H], rdx                    ; 00401518 _ 48: 89. 50, 18
        mov     rcx, qword 2E6465646565H                ; 0040151C _ 48: B9, 00002E6465646565
        mov     qword [rax+20H], rcx                    ; 00401526 _ 48: 89. 48, 20
        mov     qword [rax+28H], 0                      ; 0040152A _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 00401532 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 0040153A _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 00401542 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-30H]                    ; 0040154A _ 48: 8B. 45, D0
        mov     dword [rax+48H], 0                      ; 0040154E _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-30H]                    ; 00401555 _ 48: 8B. 45, D0
        mov     dword [rax+4CH], 0                      ; 00401559 _ C7. 40, 4C, 00000000
        jmp     ?_096                                   ; 00401560 _ EB, 01

?_095:  nop                                             ; 00401562 _ 90
?_096:  call    ?_033                                   ; 00401563 _ E8, FFFFF4D8(rel)
        mov     dword [rbp-0CH], eax                    ; 00401568 _ 89. 45, F4
        cmp     dword [rbp-0CH], -1                     ; 0040156B _ 83. 7D, F4, FF
        jz      ?_098                                   ; 0040156F _ 74, 0B
        cmp     dword [rbp-0CH], 10                     ; 00401571 _ 83. 7D, F4, 0A
        jnz     ?_095                                   ; 00401575 _ 75, EB
        jmp     ?_098                                   ; 00401577 _ EB, 03

?_097:  nop                                             ; 00401579 _ 90
        jmp     ?_099                                   ; 0040157A _ EB, 01

?_098:  nop                                             ; 0040157C _ 90
?_099:  leave                                           ; 0040157D _ C9
        ret                                             ; 0040157E _ C3
; GrabLine End of function

CheckSyntax:; Function begin
        push    rbp                                     ; 0040157F _ 55
        mov     rbp, rsp                                ; 00401580 _ 48: 89. E5
        sub     rsp, 64                                 ; 00401583 _ 48: 83. EC, 40
        mov     qword [rbp-28H], rdi                    ; 00401587 _ 48: 89. 7D, D8
        mov     qword [rbp-30H], rsi                    ; 0040158B _ 48: 89. 75, D0
        mov     qword [rbp-38H], rdx                    ; 0040158F _ 48: 89. 55, C8
        mov     rax, qword [rbp-38H]                    ; 00401593 _ 48: 8B. 45, C8
        mov     eax, dword [rax]                        ; 00401597 _ 8B. 00
        test    eax, eax                                ; 00401599 _ 85. C0
        jne     ?_110                                   ; 0040159B _ 0F 85, 00000388
        mov     rax, qword [rbp-28H]                    ; 004015A1 _ 48: 8B. 45, D8
        mov     qword [rbp-8H], rax                     ; 004015A5 _ 48: 89. 45, F8
        mov     dword [rbp-10H], 0                      ; 004015A9 _ C7. 45, F0, 00000000
        mov     dword [rbp-0CH], 0                      ; 004015B0 _ C7. 45, F4, 00000000
        mov     dword [rbp-14H], -1                     ; 004015B7 _ C7. 45, EC, FFFFFFFF
        mov     edx, 9                                  ; 004015BE _ BA, 00000009
        mov     esi, ?_190                              ; 004015C3 _ BE, 00402D00(d)
        mov     edi, pregex                             ; 004015C8 _ BF, 00604160(d)
        call    ?_025                                   ; 004015CD _ E8, FFFFF42E(rel)
        mov     dword [rbp-0CH], eax                    ; 004015D2 _ 89. 45, F4
        cmp     dword [rbp-0CH], 0                      ; 004015D5 _ 83. 7D, F4, 00
        je      ?_100                                   ; 004015D9 _ 0F 84, 00000087
        mov     rax, qword [rbp-38H]                    ; 004015DF _ 48: 8B. 45, C8
        mov     dword [rax], 1                          ; 004015E3 _ C7. 00, 00000001
        mov     rax, qword [rbp-38H]                    ; 004015E9 _ 48: 8B. 45, C8
        mov     dword [rax+4H], 301                     ; 004015ED _ C7. 40, 04, 0000012D
        mov     rax, qword [rbp-38H]                    ; 004015F4 _ 48: 8B. 45, C8
        mov     rdi, qword 6D69746E75722041H            ; 004015F8 _ 48: BF, 6D69746E75722041
        mov     qword [rax+8H], rdi                     ; 00401602 _ 48: 89. 78, 08
        mov     rdi, qword 20726F7272652065H            ; 00401606 _ 48: BF, 20726F7272652065
        mov     qword [rax+10H], rdi                    ; 00401610 _ 48: 89. 78, 10
        mov     rsi, qword 206465727563636FH            ; 00401614 _ 48: BE, 206465727563636F
        mov     qword [rax+18H], rsi                    ; 0040161E _ 48: 89. 70, 18
        mov     rdi, qword 7865676572206E69H            ; 00401622 _ 48: BF, 7865676572206E69
        mov     qword [rax+20H], rdi                    ; 0040162C _ 48: 89. 78, 20
        mov     qword [rax+28H], 26670                  ; 00401630 _ 48: C7. 40, 28, 0000682E
        mov     qword [rax+30H], 0                      ; 00401638 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 00401640 _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 00401648 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-38H]                    ; 00401650 _ 48: 8B. 45, C8
        mov     dword [rax+48H], 0                      ; 00401654 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-38H]                    ; 0040165B _ 48: 8B. 45, C8
        mov     dword [rax+4CH], 1                      ; 0040165F _ C7. 40, 4C, 00000001
?_100:  mov     rax, qword [rbp-28H]                    ; 00401666 _ 48: 8B. 45, D8
        mov     r8d, 0                                  ; 0040166A _ 41: B8, 00000000
        mov     ecx, 0                                  ; 00401670 _ B9, 00000000
        mov     edx, 0                                  ; 00401675 _ BA, 00000000
        mov     rsi, rax                                ; 0040167A _ 48: 89. C6
        mov     edi, pregex                             ; 0040167D _ BF, 00604160(d)
        call    ?_037                                   ; 00401682 _ E8, FFFFF3D9(rel)
        mov     dword [rbp-10H], eax                    ; 00401687 _ 89. 45, F0
        mov     rax, qword [rbp-28H]                    ; 0040168A _ 48: 8B. 45, D8
        movzx   eax, byte [rax]                         ; 0040168E _ 0F B6. 00
        test    al, al                                  ; 00401691 _ 84. C0
        jnz     ?_101                                   ; 00401693 _ 75, 0F
        mov     rax, qword [rbp-30H]                    ; 00401695 _ 48: 8B. 45, D0
        mov     dword [rax], 1                          ; 00401699 _ C7. 00, 00000001
        jmp     ?_111                                   ; 0040169F _ E9, 00000286

?_101:  cmp     dword [rbp-10H], 0                      ; 004016A4 _ 83. 7D, F0, 00
        je      ?_106                                   ; 004016A8 _ 0F 84, 00000188
        mov     rax, qword [rbp-38H]                    ; 004016AE _ 48: 8B. 45, C8
        mov     dword [rax], 1                          ; 004016B2 _ C7. 00, 00000001
        mov     rax, qword [rbp-38H]                    ; 004016B8 _ 48: 8B. 45, C8
        mov     dword [rax+4H], 102                     ; 004016BC _ C7. 40, 04, 00000066
        mov     rax, qword [rbp-38H]                    ; 004016C3 _ 48: 8B. 45, C8
        mov     rsi, qword 45207861746E7953H            ; 004016C7 _ 48: BE, 45207861746E7953
        mov     qword [rax+8H], rsi                     ; 004016D1 _ 48: 89. 70, 08
        mov     rdi, qword 2E726F7272H                  ; 004016D5 _ 48: BF, 0000002E726F7272
        mov     qword [rax+10H], rdi                    ; 004016DF _ 48: 89. 78, 10
        add     rax, 24                                 ; 004016E3 _ 48: 83. C0, 18
        mov     ecx, 48                                 ; 004016E7 _ B9, 00000030
        mov     esi, 0                                  ; 004016EC _ BE, 00000000
        mov     qword [rax], rsi                        ; 004016F1 _ 48: 89. 30
        mov     edx, ecx                                ; 004016F4 _ 89. CA
        add     rdx, rax                                ; 004016F6 _ 48: 01. C2
        add     rdx, 8                                  ; 004016F9 _ 48: 83. C2, 08
        mov     qword [rdx-10H], rsi                    ; 004016FD _ 48: 89. 72, F0
        lea     rdx, [rax+8H]                           ; 00401701 _ 48: 8D. 50, 08
        and     rdx, 0FFFFFFFFFFFFFFF8H                 ; 00401705 _ 48: 83. E2, F8
        sub     rax, rdx                                ; 00401709 _ 48: 29. D0
        add     ecx, eax                                ; 0040170C _ 01. C1
        and     ecx, 0FFFFFFF8H                         ; 0040170E _ 83. E1, F8
        mov     eax, ecx                                ; 00401711 _ 89. C8
        shr     eax, 3                                  ; 00401713 _ C1. E8, 03
        mov     ecx, eax                                ; 00401716 _ 89. C1
        mov     rdi, rdx                                ; 00401718 _ 48: 89. D7
        mov     rax, rsi                                ; 0040171B _ 48: 89. F0
        rep stosq                                       ; 0040171E _ F3 48: AB
        mov     rax, qword [rbp-38H]                    ; 00401721 _ 48: 8B. 45, C8
        mov     dword [rax+48H], 0                      ; 00401725 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-38H]                    ; 0040172C _ 48: 8B. 45, C8
        mov     dword [rax+4CH], 0                      ; 00401730 _ C7. 40, 4C, 00000000
        mov     rax, qword [rbp-30H]                    ; 00401737 _ 48: 8B. 45, D0
        mov     dword [rax], 2                          ; 0040173B _ C7. 00, 00000002
        jmp     ?_111                                   ; 00401741 _ E9, 000001E4

?_102:  mov     rax, qword [rbp-8H]                     ; 00401746 _ 48: 8B. 45, F8
        movzx   eax, byte [rax]                         ; 0040174A _ 0F B6. 00
        cmp     al, 62                                  ; 0040174D _ 3C, 3E
        jnz     ?_103                                   ; 0040174F _ 75, 11
        mov     dword [rbp-14H], 62                     ; 00401751 _ C7. 45, EC, 0000003E
        add     qword [rbp-8H], 1                       ; 00401758 _ 48: 83. 45, F8, 01
        jmp     ?_106                                   ; 0040175D _ E9, 000000D4

?_103:  mov     rax, qword [rbp-8H]                     ; 00401762 _ 48: 8B. 45, F8
        movzx   eax, byte [rax]                         ; 00401766 _ 0F B6. 00
        cmp     al, 60                                  ; 00401769 _ 3C, 3C
        jnz     ?_104                                   ; 0040176B _ 75, 11
        mov     dword [rbp-14H], 60                     ; 0040176D _ C7. 45, EC, 0000003C
        add     qword [rbp-8H], 1                       ; 00401774 _ 48: 83. 45, F8, 01
        jmp     ?_106                                   ; 00401779 _ E9, 000000B8

?_104:  add     qword [rbp-8H], 1                       ; 0040177E _ 48: 83. 45, F8, 01
        mov     rax, qword [rbp-8H]                     ; 00401783 _ 48: 8B. 45, F8
        movzx   eax, byte [rax]                         ; 00401787 _ 0F B6. 00
        movsx   eax, al                                 ; 0040178A _ 0F BE. C0
        cmp     eax, dword [rbp-14H]                    ; 0040178D _ 3B. 45, EC
        jne     ?_105                                   ; 00401790 _ 0F 85, 00000096
        mov     rax, qword [rbp-38H]                    ; 00401796 _ 48: 8B. 45, C8
        mov     dword [rax], 1                          ; 0040179A _ C7. 00, 00000001
        mov     rax, qword [rbp-38H]                    ; 004017A0 _ 48: 8B. 45, C8
        mov     dword [rax+4H], 112                     ; 004017A4 _ C7. 40, 04, 00000070
        mov     rax, qword [rbp-38H]                    ; 004017AB _ 48: 8B. 45, C8
        mov     rcx, qword 45207861746E7953H            ; 004017AF _ 48: B9, 45207861746E7953
        mov     qword [rax+8H], rcx                     ; 004017B9 _ 48: 89. 48, 08
        mov     rsi, qword 44202D20726F7272H            ; 004017BD _ 48: BE, 44202D20726F7272
        mov     qword [rax+10H], rsi                    ; 004017C7 _ 48: 89. 70, 10
        mov     rdi, qword 655220656C62756FH            ; 004017CB _ 48: BF, 655220656C62756F
        mov     qword [rax+18H], rdi                    ; 004017D5 _ 48: 89. 78, 18
        mov     rcx, qword 2E746365726964H              ; 004017D9 _ 48: B9, 002E746365726964
        mov     qword [rax+20H], rcx                    ; 004017E3 _ 48: 89. 48, 20
        mov     qword [rax+28H], 0                      ; 004017E7 _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 004017EF _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 004017F7 _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 004017FF _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-38H]                    ; 00401807 _ 48: 8B. 45, C8
        mov     dword [rax+48H], 0                      ; 0040180B _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-38H]                    ; 00401812 _ 48: 8B. 45, C8
        mov     dword [rax+4CH], 0                      ; 00401816 _ C7. 40, 4C, 00000000
        mov     rax, qword [rbp-30H]                    ; 0040181D _ 48: 8B. 45, D0
        mov     dword [rax], 2                          ; 00401821 _ C7. 00, 00000002
        jmp     ?_111                                   ; 00401827 _ E9, 000000FE

?_105:  mov     rax, qword [rbp-30H]                    ; 0040182C _ 48: 8B. 45, D0
        mov     dword [rax], 0                          ; 00401830 _ C7. 00, 00000000
?_106:  mov     rax, qword [rbp-8H]                     ; 00401836 _ 48: 8B. 45, F8
        movzx   eax, byte [rax]                         ; 0040183A _ 0F B6. 00
        test    al, al                                  ; 0040183D _ 84. C0
        jne     ?_102                                   ; 0040183F _ 0F 85, FFFFFF01
        mov     rax, qword [rbp-28H]                    ; 00401845 _ 48: 8B. 45, D8
        mov     qword [rbp-8H], rax                     ; 00401849 _ 48: 89. 45, F8
        jmp     ?_109                                   ; 0040184D _ E9, 000000C6

?_107:  mov     rax, qword [rbp-8H]                     ; 00401852 _ 48: 8B. 45, F8
        movzx   eax, byte [rax]                         ; 00401856 _ 0F B6. 00
        cmp     al, 32                                  ; 00401859 _ 3C, 20
        je      ?_108                                   ; 0040185B _ 0F 84, 000000A8
        mov     rax, qword [rbp-8H]                     ; 00401861 _ 48: 8B. 45, F8
        add     rax, 1                                  ; 00401865 _ 48: 83. C0, 01
        movzx   eax, byte [rax]                         ; 00401869 _ 0F B6. 00
        cmp     al, 124                                 ; 0040186C _ 3C, 7C
        jne     ?_108                                   ; 0040186E _ 0F 85, 00000095
        mov     rax, qword [rbp-38H]                    ; 00401874 _ 48: 8B. 45, C8
        mov     dword [rax], 1                          ; 00401878 _ C7. 00, 00000001
        mov     rax, qword [rbp-38H]                    ; 0040187E _ 48: 8B. 45, C8
        mov     dword [rax+4H], 102                     ; 00401882 _ C7. 40, 04, 00000066
        mov     rax, qword [rbp-38H]                    ; 00401889 _ 48: 8B. 45, C8
        mov     rsi, qword 45207861746E7953H            ; 0040188D _ 48: BE, 45207861746E7953
        mov     qword [rax+8H], rsi                     ; 00401897 _ 48: 89. 70, 08
        mov     rdi, qword 2E726F7272H                  ; 0040189B _ 48: BF, 0000002E726F7272
        mov     qword [rax+10H], rdi                    ; 004018A5 _ 48: 89. 78, 10
        add     rax, 24                                 ; 004018A9 _ 48: 83. C0, 18
        mov     ecx, 48                                 ; 004018AD _ B9, 00000030
        mov     esi, 0                                  ; 004018B2 _ BE, 00000000
        mov     qword [rax], rsi                        ; 004018B7 _ 48: 89. 30
        mov     edx, ecx                                ; 004018BA _ 89. CA
        add     rdx, rax                                ; 004018BC _ 48: 01. C2
        add     rdx, 8                                  ; 004018BF _ 48: 83. C2, 08
        mov     qword [rdx-10H], rsi                    ; 004018C3 _ 48: 89. 72, F0
        lea     rdx, [rax+8H]                           ; 004018C7 _ 48: 8D. 50, 08
        and     rdx, 0FFFFFFFFFFFFFFF8H                 ; 004018CB _ 48: 83. E2, F8
        sub     rax, rdx                                ; 004018CF _ 48: 29. D0
        add     ecx, eax                                ; 004018D2 _ 01. C1
        and     ecx, 0FFFFFFF8H                         ; 004018D4 _ 83. E1, F8
        mov     eax, ecx                                ; 004018D7 _ 89. C8
        shr     eax, 3                                  ; 004018D9 _ C1. E8, 03
        mov     ecx, eax                                ; 004018DC _ 89. C1
        mov     rdi, rdx                                ; 004018DE _ 48: 89. D7
        mov     rax, rsi                                ; 004018E1 _ 48: 89. F0
        rep stosq                                       ; 004018E4 _ F3 48: AB
        mov     rax, qword [rbp-38H]                    ; 004018E7 _ 48: 8B. 45, C8
        mov     dword [rax+48H], 0                      ; 004018EB _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-38H]                    ; 004018F2 _ 48: 8B. 45, C8
        mov     dword [rax+4CH], 0                      ; 004018F6 _ C7. 40, 4C, 00000000
        mov     rax, qword [rbp-30H]                    ; 004018FD _ 48: 8B. 45, D0
        mov     dword [rax], 2                          ; 00401901 _ C7. 00, 00000002
        jmp     ?_111                                   ; 00401907 _ EB, 21

?_108:  mov     rax, qword [rbp-30H]                    ; 00401909 _ 48: 8B. 45, D0
        mov     dword [rax], 0                          ; 0040190D _ C7. 00, 00000000
        add     qword [rbp-8H], 1                       ; 00401913 _ 48: 83. 45, F8, 01
?_109:  mov     rax, qword [rbp-8H]                     ; 00401918 _ 48: 8B. 45, F8
        movzx   eax, byte [rax]                         ; 0040191C _ 0F B6. 00
        test    al, al                                  ; 0040191F _ 84. C0
        jne     ?_107                                   ; 00401921 _ 0F 85, FFFFFF2B
        jmp     ?_111                                   ; 00401927 _ EB, 01

?_110:  nop                                             ; 00401929 _ 90
?_111:  leave                                           ; 0040192A _ C9
        ret                                             ; 0040192B _ C3
; CheckSyntax End of function

HandleError:; Function begin
        push    rbp                                     ; 0040192C _ 55
        mov     rbp, rsp                                ; 0040192D _ 48: 89. E5
        sub     rsp, 16                                 ; 00401930 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 00401934 _ 48: 89. 7D, F8
        mov     rax, qword [rbp-8H]                     ; 00401938 _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 0040193C _ 8B. 00
        cmp     eax, 1                                  ; 0040193E _ 83. F8, 01
        jnz     ?_112                                   ; 00401941 _ 75, 20
        mov     rax, qword [rbp-8H]                     ; 00401943 _ 48: 8B. 45, F8
        lea     rdx, [rax+8H]                           ; 00401947 _ 48: 8D. 50, 08
        mov     rax, qword [rbp-8H]                     ; 0040194B _ 48: 8B. 45, F8
        mov     eax, dword [rax+4H]                     ; 0040194F _ 8B. 40, 04
        mov     esi, eax                                ; 00401952 _ 89. C6
        mov     edi, ?_191                              ; 00401954 _ BF, 00402D5D(d)
        mov     eax, 0                                  ; 00401959 _ B8, 00000000
        call    ?_017                                   ; 0040195E _ E8, FFFFF05D(rel)
?_112:  mov     rax, qword [rbp-8H]                     ; 00401963 _ 48: 8B. 45, F8
        mov     eax, dword [rax+48H]                    ; 00401967 _ 8B. 40, 48
        cmp     eax, 1                                  ; 0040196A _ 83. F8, 01
        jnz     ?_113                                   ; 0040196D _ 75, 0A
        mov     edi, 0                                  ; 0040196F _ BF, 00000000
        call    ?_047                                   ; 00401974 _ E8, FFFFF137(rel)
?_113:  nop                                             ; 00401979 _ 90
        leave                                           ; 0040197A _ C9
        ret                                             ; 0040197B _ C3
; HandleError End of function

ExtractCmds:; Function begin
        push    rbp                                     ; 0040197C _ 55
        mov     rbp, rsp                                ; 0040197D _ 48: 89. E5
        sub     rsp, 48                                 ; 00401980 _ 48: 83. EC, 30
        mov     qword [rbp-28H], rdi                    ; 00401984 _ 48: 89. 7D, D8
        mov     qword [rbp-30H], rsi                    ; 00401988 _ 48: 89. 75, D0
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 0040198C _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-8H], rax                     ; 00401995 _ 48: 89. 45, F8
        xor     eax, eax                                ; 00401999 _ 31. C0
        mov     dword [rbp-18H], 0                      ; 0040199B _ C7. 45, E8, 00000000
        jmp     ?_117                                   ; 004019A2 _ E9, 00000098

?_114:  mov     dword [rbp-14H], 0                      ; 004019A7 _ C7. 45, EC, 00000000
        mov     rax, qword [rbp-28H]                    ; 004019AE _ 48: 8B. 45, D8
        mov     rcx, qword [rax+8H]                     ; 004019B2 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-18H]                    ; 004019B6 _ 8B. 45, E8
        movsxd  rdx, eax                                ; 004019B9 _ 48: 63. D0
        mov     rax, rdx                                ; 004019BC _ 48: 89. D0
        add     rax, rax                                ; 004019BF _ 48: 01. C0
        add     rax, rdx                                ; 004019C2 _ 48: 01. D0
        shl     rax, 4                                  ; 004019C5 _ 48: C1. E0, 04
        add     rax, rcx                                ; 004019C9 _ 48: 01. C8
        mov     dword [rax+10H], 0                      ; 004019CC _ C7. 40, 10, 00000000
        mov     rax, qword [rbp-28H]                    ; 004019D3 _ 48: 8B. 45, D8
        mov     rcx, qword [rax+8H]                     ; 004019D7 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-18H]                    ; 004019DB _ 8B. 45, E8
        movsxd  rdx, eax                                ; 004019DE _ 48: 63. D0
        mov     rax, rdx                                ; 004019E1 _ 48: 89. D0
        add     rax, rax                                ; 004019E4 _ 48: 01. C0
        add     rax, rdx                                ; 004019E7 _ 48: 01. D0
        shl     rax, 4                                  ; 004019EA _ 48: C1. E0, 04
        add     rax, rcx                                ; 004019EE _ 48: 01. C8
        mov     rax, qword [rax]                        ; 004019F1 _ 48: 8B. 00
        mov     qword [rbp-10H], rax                    ; 004019F4 _ 48: 89. 45, F0
?_115:  mov     rax, qword [rbp-28H]                    ; 004019F8 _ 48: 8B. 45, D8
        mov     rcx, qword [rax+8H]                     ; 004019FC _ 48: 8B. 48, 08
        mov     eax, dword [rbp-18H]                    ; 00401A00 _ 8B. 45, E8
        movsxd  rdx, eax                                ; 00401A03 _ 48: 63. D0
        mov     rax, rdx                                ; 00401A06 _ 48: 89. D0
        add     rax, rax                                ; 00401A09 _ 48: 01. C0
        add     rax, rdx                                ; 00401A0C _ 48: 01. D0
        shl     rax, 4                                  ; 00401A0F _ 48: C1. E0, 04
        lea     rdi, [rcx+rax]                          ; 00401A13 _ 48: 8D. 3C 01
        mov     rdx, qword [rbp-30H]                    ; 00401A17 _ 48: 8B. 55, D0
        lea     rsi, [rbp-10H]                          ; 00401A1B _ 48: 8D. 75, F0
        mov     eax, dword [rbp-14H]                    ; 00401A1F _ 8B. 45, EC
        mov     rcx, rdx                                ; 00401A22 _ 48: 89. D1
        mov     rdx, rdi                                ; 00401A25 _ 48: 89. FA
        mov     edi, eax                                ; 00401A28 _ 89. C7
        call    RunExtractor                            ; 00401A2A _ E8, 00000037
        mov     dword [rbp-14H], eax                    ; 00401A2F _ 89. 45, EC
        cmp     dword [rbp-14H], 8                      ; 00401A32 _ 83. 7D, EC, 08
        jz      ?_116                                   ; 00401A36 _ 74, 02
        jmp     ?_115                                   ; 00401A38 _ EB, BE

?_116:  nop                                             ; 00401A3A _ 90
        add     dword [rbp-18H], 1                      ; 00401A3B _ 83. 45, E8, 01
?_117:  mov     rax, qword [rbp-28H]                    ; 00401A3F _ 48: 8B. 45, D8
        mov     eax, dword [rax+10H]                    ; 00401A43 _ 8B. 40, 10
        cmp     eax, dword [rbp-18H]                    ; 00401A46 _ 3B. 45, E8
        jg      ?_114                                   ; 00401A49 _ 0F 8F, FFFFFF58
        nop                                             ; 00401A4F _ 90
        mov     rax, qword [rbp-8H]                     ; 00401A50 _ 48: 8B. 45, F8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rax, qword [fs:abs 28H]                 ; 00401A54 _ 64 48: 33. 04 25, 00000028
        jz      ?_118                                   ; 00401A5D _ 74, 05
        call    ?_013                                   ; 00401A5F _ E8, FFFFEF3C(rel)
?_118:  leave                                           ; 00401A64 _ C9
        ret                                             ; 00401A65 _ C3
; ExtractCmds End of function

RunExtractor:; Function begin
        push    rbp                                     ; 00401A66 _ 55
        mov     rbp, rsp                                ; 00401A67 _ 48: 89. E5
        push    rbx                                     ; 00401A6A _ 53
        sub     rsp, 56                                 ; 00401A6B _ 48: 83. EC, 38
        mov     dword [rbp-24H], edi                    ; 00401A6F _ 89. 7D, DC
        mov     qword [rbp-30H], rsi                    ; 00401A72 _ 48: 89. 75, D0
        mov     qword [rbp-38H], rdx                    ; 00401A76 _ 48: 89. 55, C8
        mov     qword [rbp-40H], rcx                    ; 00401A7A _ 48: 89. 4D, C0
        mov     dword [rbp-18H], 8                      ; 00401A7E _ C7. 45, E8, 00000008
        cmp     dword [rbp-24H], 8                      ; 00401A85 _ 83. 7D, DC, 08
        ja      ?_132                                   ; 00401A89 _ 0F 87, 00000229
        mov     eax, dword [rbp-24H]                    ; 00401A8F _ 8B. 45, DC
; Note: Address is not rip-relative
        mov     rax, qword [abs ?_193+rax*8]            ; 00401A92 _ 48: 8B. 04 C5, 00402D70(d)
        jmp     rax                                     ; 00401A9A _ FF. E0

?_119:  mov     edi, 65                                 ; 00401A9C _ BF, 00000041
        call    ?_035                                   ; 00401AA1 _ E8, FFFFEFAA(rel)
        mov     rdx, rax                                ; 00401AA6 _ 48: 89. C2
        mov     rax, qword [rbp-38H]                    ; 00401AA9 _ 48: 8B. 45, C8
        mov     qword [rax+8H], rdx                     ; 00401AAD _ 48: 89. 50, 08
        mov     rax, qword [rbp-38H]                    ; 00401AB1 _ 48: 8B. 45, C8
        mov     rax, qword [rax]                        ; 00401AB5 _ 48: 8B. 00
        mov     esi, ?_192                              ; 00401AB8 _ BE, 00402D6B(d)
        mov     rdi, rax                                ; 00401ABD _ 48: 89. C7
        call    ?_043                                   ; 00401AC0 _ E8, FFFFEFCB(rel)
        mov     rdx, rax                                ; 00401AC5 _ 48: 89. C2
        mov     rax, qword [rbp-30H]                    ; 00401AC8 _ 48: 8B. 45, D0
        mov     qword [rax], rdx                        ; 00401ACC _ 48: 89. 10
        mov     dword [rbp-18H], 6                      ; 00401ACF _ C7. 45, E8, 00000006
        jmp     ?_132                                   ; 00401AD6 _ E9, 000001DD

?_120:  mov     esi, ?_192                              ; 00401ADB _ BE, 00402D6B(d)
        mov     edi, 0                                  ; 00401AE0 _ BF, 00000000
        call    ?_043                                   ; 00401AE5 _ E8, FFFFEFA6(rel)
        mov     rdx, rax                                ; 00401AEA _ 48: 89. C2
        mov     rax, qword [rbp-30H]                    ; 00401AED _ 48: 8B. 45, D0
        mov     qword [rax], rdx                        ; 00401AF1 _ 48: 89. 10
        mov     rax, qword [rbp-30H]                    ; 00401AF4 _ 48: 8B. 45, D0
        mov     rax, qword [rax]                        ; 00401AF8 _ 48: 8B. 00
        test    rax, rax                                ; 00401AFB _ 48: 85. C0
        jz      ?_121                                   ; 00401AFE _ 74, 0E
        mov     rax, qword [rbp-30H]                    ; 00401B00 _ 48: 8B. 45, D0
        mov     rax, qword [rax]                        ; 00401B04 _ 48: 8B. 00
        movzx   eax, byte [rax]                         ; 00401B07 _ 0F B6. 00
        test    al, al                                  ; 00401B0A _ 84. C0
        jnz     ?_122                                   ; 00401B0C _ 75, 0C
?_121:  mov     dword [rbp-18H], 7                      ; 00401B0E _ C7. 45, E8, 00000007
        jmp     ?_132                                   ; 00401B15 _ E9, 0000019E

?_122:  mov     rax, qword [rbp-30H]                    ; 00401B1A _ 48: 8B. 45, D0
        mov     rax, qword [rax]                        ; 00401B1E _ 48: 8B. 00
        movzx   eax, byte [rax]                         ; 00401B21 _ 0F B6. 00
        cmp     al, 60                                  ; 00401B24 _ 3C, 3C
        jnz     ?_123                                   ; 00401B26 _ 75, 0C
        mov     dword [rbp-18H], 3                      ; 00401B28 _ C7. 45, E8, 00000003
        jmp     ?_132                                   ; 00401B2F _ E9, 00000184

?_123:  mov     rax, qword [rbp-30H]                    ; 00401B34 _ 48: 8B. 45, D0
        mov     rax, qword [rax]                        ; 00401B38 _ 48: 8B. 00
        movzx   eax, byte [rax]                         ; 00401B3B _ 0F B6. 00
        cmp     al, 62                                  ; 00401B3E _ 3C, 3E
        jnz     ?_124                                   ; 00401B40 _ 75, 0C
        mov     dword [rbp-18H], 2                      ; 00401B42 _ C7. 45, E8, 00000002
        jmp     ?_132                                   ; 00401B49 _ E9, 0000016A

?_124:  mov     dword [rbp-18H], 6                      ; 00401B4E _ C7. 45, E8, 00000006
        jmp     ?_132                                   ; 00401B55 _ E9, 0000015E

?_125:  mov     rax, qword [rbp-38H]                    ; 00401B5A _ 48: 8B. 45, C8
        mov     dword [rax+14H], 1                      ; 00401B5E _ C7. 40, 14, 00000001
        mov     dword [rbp-18H], 4                      ; 00401B65 _ C7. 45, E8, 00000004
        jmp     ?_132                                   ; 00401B6C _ E9, 00000147

?_126:  mov     esi, ?_192                              ; 00401B71 _ BE, 00402D6B(d)
        mov     edi, 0                                  ; 00401B76 _ BF, 00000000
        call    ?_043                                   ; 00401B7B _ E8, FFFFEF10(rel)
        mov     rdx, rax                                ; 00401B80 _ 48: 89. C2
        mov     rax, qword [rbp-30H]                    ; 00401B83 _ 48: 8B. 45, D0
        mov     qword [rax], rdx                        ; 00401B87 _ 48: 89. 10
        mov     rax, qword [rbp-30H]                    ; 00401B8A _ 48: 8B. 45, D0
        mov     rdx, qword [rax]                        ; 00401B8E _ 48: 8B. 10
        mov     rax, qword [rbp-38H]                    ; 00401B91 _ 48: 8B. 45, C8
        mov     rax, qword [rax+20H]                    ; 00401B95 _ 48: 8B. 40, 20
        mov     rsi, rdx                                ; 00401B99 _ 48: 89. D6
        mov     rdi, rax                                ; 00401B9C _ 48: 89. C7
        call    ?_005                                   ; 00401B9F _ E8, FFFFEDBC(rel)
        mov     dword [rbp-18H], 1                      ; 00401BA4 _ C7. 45, E8, 00000001
        jmp     ?_132                                   ; 00401BAB _ E9, 00000108

?_127:  mov     rax, qword [rbp-38H]                    ; 00401BB0 _ 48: 8B. 45, C8
        mov     dword [rax+18H], 1                      ; 00401BB4 _ C7. 40, 18, 00000001
        mov     dword [rbp-18H], 5                      ; 00401BBB _ C7. 45, E8, 00000005
        jmp     ?_132                                   ; 00401BC2 _ E9, 000000F1

?_128:  mov     esi, ?_192                              ; 00401BC7 _ BE, 00402D6B(d)
        mov     edi, 0                                  ; 00401BCC _ BF, 00000000
        call    ?_043                                   ; 00401BD1 _ E8, FFFFEEBA(rel)
        mov     rdx, rax                                ; 00401BD6 _ 48: 89. C2
        mov     rax, qword [rbp-30H]                    ; 00401BD9 _ 48: 8B. 45, D0
        mov     qword [rax], rdx                        ; 00401BDD _ 48: 89. 10
        mov     rax, qword [rbp-30H]                    ; 00401BE0 _ 48: 8B. 45, D0
        mov     rdx, qword [rax]                        ; 00401BE4 _ 48: 8B. 10
        mov     rax, qword [rbp-38H]                    ; 00401BE7 _ 48: 8B. 45, C8
        mov     rax, qword [rax+28H]                    ; 00401BEB _ 48: 8B. 40, 28
        mov     rsi, rdx                                ; 00401BEF _ 48: 89. D6
        mov     rdi, rax                                ; 00401BF2 _ 48: 89. C7
        call    ?_005                                   ; 00401BF5 _ E8, FFFFED66(rel)
        mov     dword [rbp-18H], 1                      ; 00401BFA _ C7. 45, E8, 00000001
        jmp     ?_132                                   ; 00401C01 _ E9, 000000B2

?_129:  mov     rax, qword [rbp-38H]                    ; 00401C06 _ 48: 8B. 45, C8
        mov     eax, dword [rax+10H]                    ; 00401C0A _ 8B. 40, 10
        mov     dword [rbp-14H], eax                    ; 00401C0D _ 89. 45, EC
        mov     rax, qword [rbp-38H]                    ; 00401C10 _ 48: 8B. 45, C8
        mov     rax, qword [rax+8H]                     ; 00401C14 _ 48: 8B. 40, 08
        mov     edx, dword [rbp-14H]                    ; 00401C18 _ 8B. 55, EC
        movsxd  rdx, edx                                ; 00401C1B _ 48: 63. D2
        shl     rdx, 3                                  ; 00401C1E _ 48: C1. E2, 03
        lea     rbx, [rax+rdx]                          ; 00401C22 _ 48: 8D. 1C 10
        mov     rax, qword [rbp-30H]                    ; 00401C26 _ 48: 8B. 45, D0
        mov     rax, qword [rax]                        ; 00401C2A _ 48: 8B. 00
        mov     rdi, rax                                ; 00401C2D _ 48: 89. C7
        call    ?_009                                   ; 00401C30 _ E8, FFFFED4B(rel)
        add     rax, 1                                  ; 00401C35 _ 48: 83. C0, 01
        mov     rdi, rax                                ; 00401C39 _ 48: 89. C7
        call    ?_035                                   ; 00401C3C _ E8, FFFFEE0F(rel)
        mov     qword [rbx], rax                        ; 00401C41 _ 48: 89. 03
        mov     rax, qword [rbp-30H]                    ; 00401C44 _ 48: 8B. 45, D0
        mov     rdx, qword [rax]                        ; 00401C48 _ 48: 8B. 10
        mov     rax, qword [rbp-38H]                    ; 00401C4B _ 48: 8B. 45, C8
        mov     rax, qword [rax+8H]                     ; 00401C4F _ 48: 8B. 40, 08
        mov     ecx, dword [rbp-14H]                    ; 00401C53 _ 8B. 4D, EC
        movsxd  rcx, ecx                                ; 00401C56 _ 48: 63. C9
        shl     rcx, 3                                  ; 00401C59 _ 48: C1. E1, 03
        add     rax, rcx                                ; 00401C5D _ 48: 01. C8
        mov     rax, qword [rax]                        ; 00401C60 _ 48: 8B. 00
        mov     rsi, rdx                                ; 00401C63 _ 48: 89. D6
        mov     rdi, rax                                ; 00401C66 _ 48: 89. C7
        call    ?_005                                   ; 00401C69 _ E8, FFFFECF2(rel)
        mov     rax, qword [rbp-38H]                    ; 00401C6E _ 48: 8B. 45, C8
        mov     eax, dword [rax+10H]                    ; 00401C72 _ 8B. 40, 10
        lea     edx, [rax+1H]                           ; 00401C75 _ 8D. 50, 01
        mov     rax, qword [rbp-38H]                    ; 00401C78 _ 48: 8B. 45, C8
        mov     dword [rax+10H], edx                    ; 00401C7C _ 89. 50, 10
        mov     dword [rbp-18H], 1                      ; 00401C7F _ C7. 45, E8, 00000001
        jmp     ?_132                                   ; 00401C86 _ EB, 30

?_130:  mov     rax, qword [rbp-38H]                    ; 00401C88 _ 48: 8B. 45, C8
        mov     rdx, qword [rax+8H]                     ; 00401C8C _ 48: 8B. 50, 08
        mov     rax, qword [rbp-38H]                    ; 00401C90 _ 48: 8B. 45, C8
        mov     eax, dword [rax+10H]                    ; 00401C94 _ 8B. 40, 10
        cdqe                                            ; 00401C97 _ 48: 98
        shl     rax, 3                                  ; 00401C99 _ 48: C1. E0, 03
        add     rax, rdx                                ; 00401C9D _ 48: 01. D0
        mov     qword [rax], 0                          ; 00401CA0 _ 48: C7. 00, 00000000
        mov     dword [rbp-18H], 8                      ; 00401CA7 _ C7. 45, E8, 00000008
        jmp     ?_132                                   ; 00401CAE _ EB, 08

?_131:  mov     dword [rbp-18H], 8                      ; 00401CB0 _ C7. 45, E8, 00000008
        nop                                             ; 00401CB7 _ 90
?_132:  mov     eax, dword [rbp-18H]                    ; 00401CB8 _ 8B. 45, E8
        add     rsp, 56                                 ; 00401CBB _ 48: 83. C4, 38
        pop     rbx                                     ; 00401CBF _ 5B
        pop     rbp                                     ; 00401CC0 _ 5D
        ret                                             ; 00401CC1 _ C3
; RunExtractor End of function

DebugPrintCommands:; Function begin
        push    rbp                                     ; 00401CC2 _ 55
        mov     rbp, rsp                                ; 00401CC3 _ 48: 89. E5
        mov     qword [rbp-18H], rdi                    ; 00401CC6 _ 48: 89. 7D, E8
        mov     dword [rbp-8H], 0                       ; 00401CCA _ C7. 45, F8, 00000000
        jmp     ?_136                                   ; 00401CD1 _ EB, 5D

?_133:  mov     dword [rbp-4H], 0                       ; 00401CD3 _ C7. 45, FC, 00000000
        jmp     ?_135                                   ; 00401CDA _ EB, 04

?_134:  add     dword [rbp-4H], 1                       ; 00401CDC _ 83. 45, FC, 01
?_135:  mov     rax, qword [rbp-18H]                    ; 00401CE0 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 00401CE4 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-8H]                     ; 00401CE8 _ 8B. 45, F8
        movsxd  rdx, eax                                ; 00401CEB _ 48: 63. D0
        mov     rax, rdx                                ; 00401CEE _ 48: 89. D0
        add     rax, rax                                ; 00401CF1 _ 48: 01. C0
        add     rax, rdx                                ; 00401CF4 _ 48: 01. D0
        shl     rax, 4                                  ; 00401CF7 _ 48: C1. E0, 04
        add     rax, rcx                                ; 00401CFB _ 48: 01. C8
        mov     eax, dword [rax+10H]                    ; 00401CFE _ 8B. 40, 10
        cmp     eax, dword [rbp-4H]                     ; 00401D01 _ 3B. 45, FC
        jg      ?_134                                   ; 00401D04 _ 7F, D6
        mov     eax, dword [rbp-8H]                     ; 00401D06 _ 8B. 45, F8
        movsxd  rdx, eax                                ; 00401D09 _ 48: 63. D0
        mov     rax, rdx                                ; 00401D0C _ 48: 89. D0
        add     rax, rax                                ; 00401D0F _ 48: 01. C0
        add     rax, rdx                                ; 00401D12 _ 48: 01. D0
        shl     rax, 4                                  ; 00401D15 _ 48: C1. E0, 04
        mov     eax, dword [rbp-8H]                     ; 00401D19 _ 8B. 45, F8
        movsxd  rdx, eax                                ; 00401D1C _ 48: 63. D0
        mov     rax, rdx                                ; 00401D1F _ 48: 89. D0
        add     rax, rax                                ; 00401D22 _ 48: 01. C0
        add     rax, rdx                                ; 00401D25 _ 48: 01. D0
        shl     rax, 4                                  ; 00401D28 _ 48: C1. E0, 04
        add     dword [rbp-8H], 1                       ; 00401D2C _ 83. 45, F8, 01
?_136:  mov     rax, qword [rbp-18H]                    ; 00401D30 _ 48: 8B. 45, E8
        mov     eax, dword [rax+10H]                    ; 00401D34 _ 8B. 40, 10
        cmp     eax, dword [rbp-8H]                     ; 00401D37 _ 3B. 45, F8
        jg      ?_133                                   ; 00401D3A _ 7F, 97
        nop                                             ; 00401D3C _ 90
        pop     rbp                                     ; 00401D3D _ 5D
        ret                                             ; 00401D3E _ C3
; DebugPrintCommands End of function

SetRedirs:; Function begin
        push    rbp                                     ; 00401D3F _ 55
        mov     rbp, rsp                                ; 00401D40 _ 48: 89. E5
        sub     rsp, 48                                 ; 00401D43 _ 48: 83. EC, 30
        mov     qword [rbp-18H], rdi                    ; 00401D47 _ 48: 89. 7D, E8
        mov     qword [rbp-20H], rsi                    ; 00401D4B _ 48: 89. 75, E0
        mov     dword [rbp-24H], edx                    ; 00401D4F _ 89. 55, DC
        mov     rax, qword [rbp-18H]                    ; 00401D52 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 00401D56 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-24H]                    ; 00401D5A _ 8B. 45, DC
        movsxd  rdx, eax                                ; 00401D5D _ 48: 63. D0
        mov     rax, rdx                                ; 00401D60 _ 48: 89. D0
        add     rax, rax                                ; 00401D63 _ 48: 01. C0
        add     rax, rdx                                ; 00401D66 _ 48: 01. D0
        shl     rax, 4                                  ; 00401D69 _ 48: C1. E0, 04
        add     rax, rcx                                ; 00401D6D _ 48: 01. C8
        mov     eax, dword [rax+14H]                    ; 00401D70 _ 8B. 40, 14
        test    eax, eax                                ; 00401D73 _ 85. C0
        je      ?_138                                   ; 00401D75 _ 0F 84, 000000E0
        mov     rax, qword [rbp-18H]                    ; 00401D7B _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 00401D7F _ 48: 8B. 48, 08
        mov     eax, dword [rbp-24H]                    ; 00401D83 _ 8B. 45, DC
        movsxd  rdx, eax                                ; 00401D86 _ 48: 63. D0
        mov     rax, rdx                                ; 00401D89 _ 48: 89. D0
        add     rax, rax                                ; 00401D8C _ 48: 01. C0
        add     rax, rdx                                ; 00401D8F _ 48: 01. D0
        shl     rax, 4                                  ; 00401D92 _ 48: C1. E0, 04
        add     rax, rcx                                ; 00401D96 _ 48: 01. C8
        mov     rax, qword [rax+20H]                    ; 00401D99 _ 48: 8B. 40, 20
        mov     edx, 432                                ; 00401D9D _ BA, 000001B0
        mov     esi, 65                                 ; 00401DA2 _ BE, 00000041
        mov     rdi, rax                                ; 00401DA7 _ 48: 89. C7
        mov     eax, 0                                  ; 00401DAA _ B8, 00000000
        call    ?_041                                   ; 00401DAF _ E8, FFFFECCC(rel)
        mov     dword [rbp-8H], eax                     ; 00401DB4 _ 89. 45, F8
        cmp     dword [rbp-8H], 0                       ; 00401DB7 _ 83. 7D, F8, 00
        jns     ?_137                                   ; 00401DBB _ 0F 89, 00000081
        mov     rax, qword [rbp-20H]                    ; 00401DC1 _ 48: 8B. 45, E0
        mov     dword [rax], 1                          ; 00401DC5 _ C7. 00, 00000001
        mov     rax, qword [rbp-20H]                    ; 00401DCB _ 48: 8B. 45, E0
        mov     dword [rax+4H], 401                     ; 00401DCF _ C7. 40, 04, 00000191
        mov     rax, qword [rbp-20H]                    ; 00401DD6 _ 48: 8B. 45, E0
        mov     rsi, qword 657220726F727245H            ; 00401DDA _ 48: BE, 657220726F727245
        mov     qword [rax+8H], rsi                     ; 00401DE4 _ 48: 89. 70, 08
        mov     rsi, qword 6E69746365726964H            ; 00401DE8 _ 48: BE, 6E69746365726964
        mov     qword [rax+10H], rsi                    ; 00401DF2 _ 48: 89. 70, 10
        mov     rdi, qword 6C6966206F742067H            ; 00401DF6 _ 48: BF, 6C6966206F742067
        mov     qword [rax+18H], rdi                    ; 00401E00 _ 48: 89. 78, 18
        mov     qword [rax+20H], 11877                  ; 00401E04 _ 48: C7. 40, 20, 00002E65
        mov     qword [rax+28H], 0                      ; 00401E0C _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 00401E14 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 00401E1C _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 00401E24 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-20H]                    ; 00401E2C _ 48: 8B. 45, E0
        mov     dword [rax+48H], 0                      ; 00401E30 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-20H]                    ; 00401E37 _ 48: 8B. 45, E0
        mov     dword [rax+4CH], 0                      ; 00401E3B _ C7. 40, 4C, 00000000
?_137:  mov     eax, dword [rbp-8H]                     ; 00401E42 _ 8B. 45, F8
        mov     esi, 1                                  ; 00401E45 _ BE, 00000001
        mov     edi, eax                                ; 00401E4A _ 89. C7
        call    ?_015                                   ; 00401E4C _ E8, FFFFEB5F(rel)
        mov     eax, dword [rbp-8H]                     ; 00401E51 _ 8B. 45, F8
        mov     edi, eax                                ; 00401E54 _ 89. C7
        call    ?_021                                   ; 00401E56 _ E8, FFFFEB85(rel)
?_138:  mov     rax, qword [rbp-18H]                    ; 00401E5B _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 00401E5F _ 48: 8B. 48, 08
        mov     eax, dword [rbp-24H]                    ; 00401E63 _ 8B. 45, DC
        movsxd  rdx, eax                                ; 00401E66 _ 48: 63. D0
        mov     rax, rdx                                ; 00401E69 _ 48: 89. D0
        add     rax, rax                                ; 00401E6C _ 48: 01. C0
        add     rax, rdx                                ; 00401E6F _ 48: 01. D0
        shl     rax, 4                                  ; 00401E72 _ 48: C1. E0, 04
        add     rax, rcx                                ; 00401E76 _ 48: 01. C8
        mov     eax, dword [rax+18H]                    ; 00401E79 _ 8B. 40, 18
        test    eax, eax                                ; 00401E7C _ 85. C0
        je      ?_140                                   ; 00401E7E _ 0F 84, 000000DB
        mov     rax, qword [rbp-18H]                    ; 00401E84 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 00401E88 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-24H]                    ; 00401E8C _ 8B. 45, DC
        movsxd  rdx, eax                                ; 00401E8F _ 48: 63. D0
        mov     rax, rdx                                ; 00401E92 _ 48: 89. D0
        add     rax, rax                                ; 00401E95 _ 48: 01. C0
        add     rax, rdx                                ; 00401E98 _ 48: 01. D0
        shl     rax, 4                                  ; 00401E9B _ 48: C1. E0, 04
        add     rax, rcx                                ; 00401E9F _ 48: 01. C8
        mov     rax, qword [rax+28H]                    ; 00401EA2 _ 48: 8B. 40, 28
        mov     esi, 0                                  ; 00401EA6 _ BE, 00000000
        mov     rdi, rax                                ; 00401EAB _ 48: 89. C7
        mov     eax, 0                                  ; 00401EAE _ B8, 00000000
        call    ?_041                                   ; 00401EB3 _ E8, FFFFEBC8(rel)
        mov     dword [rbp-4H], eax                     ; 00401EB8 _ 89. 45, FC
        cmp     dword [rbp-4H], 0                       ; 00401EBB _ 83. 7D, FC, 00
        jns     ?_139                                   ; 00401EBF _ 0F 89, 00000081
        mov     rax, qword [rbp-20H]                    ; 00401EC5 _ 48: 8B. 45, E0
        mov     dword [rax], 1                          ; 00401EC9 _ C7. 00, 00000001
        mov     rax, qword [rbp-20H]                    ; 00401ECF _ 48: 8B. 45, E0
        mov     dword [rax+4H], 401                     ; 00401ED3 _ C7. 40, 04, 00000191
        mov     rax, qword [rbp-20H]                    ; 00401EDA _ 48: 8B. 45, E0
        mov     rcx, qword 657220726F727245H            ; 00401EDE _ 48: B9, 657220726F727245
        mov     qword [rax+8H], rcx                     ; 00401EE8 _ 48: 89. 48, 08
        mov     rsi, qword 6E69746365726964H            ; 00401EEC _ 48: BE, 6E69746365726964
        mov     qword [rax+10H], rsi                    ; 00401EF6 _ 48: 89. 70, 10
        mov     rdi, qword 6C6966206F742067H            ; 00401EFA _ 48: BF, 6C6966206F742067
        mov     qword [rax+18H], rdi                    ; 00401F04 _ 48: 89. 78, 18
        mov     qword [rax+20H], 11877                  ; 00401F08 _ 48: C7. 40, 20, 00002E65
        mov     qword [rax+28H], 0                      ; 00401F10 _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 00401F18 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 00401F20 _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 00401F28 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-20H]                    ; 00401F30 _ 48: 8B. 45, E0
        mov     dword [rax+48H], 0                      ; 00401F34 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-20H]                    ; 00401F3B _ 48: 8B. 45, E0
        mov     dword [rax+4CH], 0                      ; 00401F3F _ C7. 40, 4C, 00000000
?_139:  mov     eax, dword [rbp-4H]                     ; 00401F46 _ 8B. 45, FC
        mov     esi, 0                                  ; 00401F49 _ BE, 00000000
        mov     edi, eax                                ; 00401F4E _ 89. C7
        call    ?_015                                   ; 00401F50 _ E8, FFFFEA5B(rel)
        mov     eax, dword [rbp-4H]                     ; 00401F55 _ 8B. 45, FC
        mov     edi, eax                                ; 00401F58 _ 89. C7
        call    ?_021                                   ; 00401F5A _ E8, FFFFEA81(rel)
?_140:  nop                                             ; 00401F5F _ 90
        leave                                           ; 00401F60 _ C9
        ret                                             ; 00401F61 _ C3
; SetRedirs End of function

SetUpAndExecute:; Function begin
        push    rbp                                     ; 00401F62 _ 55
        mov     rbp, rsp                                ; 00401F63 _ 48: 89. E5
        push    r15                                     ; 00401F66 _ 41: 57
        push    r14                                     ; 00401F68 _ 41: 56
        push    r13                                     ; 00401F6A _ 41: 55
        push    r12                                     ; 00401F6C _ 41: 54
        push    rbx                                     ; 00401F6E _ 53
        sub     rsp, 120                                ; 00401F6F _ 48: 83. EC, 78
        mov     qword [rbp-88H], rdi                    ; 00401F73 _ 48: 89. BD, FFFFFF78
        mov     qword [rbp-90H], rsi                    ; 00401F7A _ 48: 89. B5, FFFFFF70
        mov     dword [rbp-94H], edx                    ; 00401F81 _ 89. 95, FFFFFF6C
        mov     dword [rbp-98H], ecx                    ; 00401F87 _ 89. 8D, FFFFFF68
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 00401F8D _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-38H], rax                    ; 00401F96 _ 48: 89. 45, C8
        xor     eax, eax                                ; 00401F9A _ 31. C0
        cmp     dword [rbp-98H], 0                      ; 00401F9C _ 83. BD, FFFFFF68, 00
        je      ?_170                                   ; 00401FA3 _ 0F 84, 00000733
        mov     rax, rsp                                ; 00401FA9 _ 48: 89. E0
        mov     rbx, rax                                ; 00401FAC _ 48: 89. C3
        mov     rax, qword [rbp-88H]                    ; 00401FAF _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 00401FB6 _ 8B. 40, 10
        movsxd  rdx, eax                                ; 00401FB9 _ 48: 63. D0
        sub     rdx, 1                                  ; 00401FBC _ 48: 83. EA, 01
        mov     qword [rbp-58H], rdx                    ; 00401FC0 _ 48: 89. 55, A8
        movsxd  rdx, eax                                ; 00401FC4 _ 48: 63. D0
        mov     r14, rdx                                ; 00401FC7 _ 49: 89. D6
        mov     r15d, 0                                 ; 00401FCA _ 41: BF, 00000000
        movsxd  rdx, eax                                ; 00401FD0 _ 48: 63. D0
        mov     r12, rdx                                ; 00401FD3 _ 49: 89. D4
        mov     r13d, 0                                 ; 00401FD6 _ 41: BD, 00000000
        cdqe                                            ; 00401FDC _ 48: 98
        shl     rax, 2                                  ; 00401FDE _ 48: C1. E0, 02
        lea     rdx, [rax+3H]                           ; 00401FE2 _ 48: 8D. 50, 03
        mov     eax, 16                                 ; 00401FE6 _ B8, 00000010
        sub     rax, 1                                  ; 00401FEB _ 48: 83. E8, 01
        add     rax, rdx                                ; 00401FEF _ 48: 01. D0
        mov     ecx, 16                                 ; 00401FF2 _ B9, 00000010
        mov     edx, 0                                  ; 00401FF7 _ BA, 00000000
        div     rcx                                     ; 00401FFC _ 48: F7. F1
        imul    rax, rax, 16                            ; 00401FFF _ 48: 6B. C0, 10
        sub     rsp, rax                                ; 00402003 _ 48: 29. C4
        mov     rax, rsp                                ; 00402006 _ 48: 89. E0
        add     rax, 3                                  ; 00402009 _ 48: 83. C0, 03
        shr     rax, 2                                  ; 0040200D _ 48: C1. E8, 02
        shl     rax, 2                                  ; 00402011 _ 48: C1. E0, 02
        mov     qword [rbp-50H], rax                    ; 00402015 _ 48: 89. 45, B0
        mov     rax, qword [rbp-88H]                    ; 00402019 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 00402020 _ 8B. 40, 10
        sub     eax, 1                                  ; 00402023 _ 83. E8, 01
        movsxd  rdx, eax                                ; 00402026 _ 48: 63. D0
        sub     rdx, 1                                  ; 00402029 _ 48: 83. EA, 01
        mov     qword [rbp-48H], rdx                    ; 0040202D _ 48: 89. 55, B8
        movsxd  rdx, eax                                ; 00402031 _ 48: 63. D0
        mov     r10, rdx                                ; 00402034 _ 49: 89. D2
        mov     r11d, 0                                 ; 00402037 _ 41: BB, 00000000
        movsxd  rdx, eax                                ; 0040203D _ 48: 63. D0
        mov     r8, rdx                                 ; 00402040 _ 49: 89. D0
        mov     r9d, 0                                  ; 00402043 _ 41: B9, 00000000
        cdqe                                            ; 00402049 _ 48: 98
        shl     rax, 3                                  ; 0040204B _ 48: C1. E0, 03
        lea     rdx, [rax+3H]                           ; 0040204F _ 48: 8D. 50, 03
        mov     eax, 16                                 ; 00402053 _ B8, 00000010
        sub     rax, 1                                  ; 00402058 _ 48: 83. E8, 01
        add     rax, rdx                                ; 0040205C _ 48: 01. D0
        mov     edi, 16                                 ; 0040205F _ BF, 00000010
        mov     edx, 0                                  ; 00402064 _ BA, 00000000
        div     rdi                                     ; 00402069 _ 48: F7. F7
        imul    rax, rax, 16                            ; 0040206C _ 48: 6B. C0, 10
        sub     rsp, rax                                ; 00402070 _ 48: 29. C4
        mov     rax, rsp                                ; 00402073 _ 48: 89. E0
        add     rax, 3                                  ; 00402076 _ 48: 83. C0, 03
        shr     rax, 2                                  ; 0040207A _ 48: C1. E8, 02
        shl     rax, 2                                  ; 0040207E _ 48: C1. E0, 02
        mov     qword [rbp-40H], rax                    ; 00402082 _ 48: 89. 45, C0
        mov     dword [rbp-78H], 0                      ; 00402086 _ C7. 45, 88, 00000000
        jmp     ?_143                                   ; 0040208D _ E9, 000000CF

?_141:  mov     eax, dword [rbp-78H]                    ; 00402092 _ 8B. 45, 88
        cdqe                                            ; 00402095 _ 48: 98
        lea     rdx, [rax*8]                            ; 00402097 _ 48: 8D. 14 C5, 00000000
        mov     rax, qword [rbp-40H]                    ; 0040209F _ 48: 8B. 45, C0
        add     rax, rdx                                ; 004020A3 _ 48: 01. D0
        mov     rdi, rax                                ; 004020A6 _ 48: 89. C7
        call    ?_023                                   ; 004020A9 _ E8, FFFFE942(rel)
        mov     dword [rbp-68H], eax                    ; 004020AE _ 89. 45, 98
        cmp     dword [rbp-68H], 0                      ; 004020B1 _ 83. 7D, 98, 00
        je      ?_142                                   ; 004020B5 _ 0F 84, 000000A2
        mov     rax, qword [rbp-90H]                    ; 004020BB _ 48: 8B. 85, FFFFFF70
        mov     dword [rax], 1                          ; 004020C2 _ C7. 00, 00000001
        mov     rax, qword [rbp-90H]                    ; 004020C8 _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+4H], 601                     ; 004020CF _ C7. 40, 04, 00000259
        mov     rax, qword [rbp-90H]                    ; 004020D6 _ 48: 8B. 85, FFFFFF70
        mov     rsi, qword 6520676E69706950H            ; 004020DD _ 48: BE, 6520676E69706950
        mov     qword [rax+8H], rsi                     ; 004020E7 _ 48: 89. 70, 08
        mov     rsi, qword 2E726F7272H                  ; 004020EB _ 48: BE, 0000002E726F7272
        mov     qword [rax+10H], rsi                    ; 004020F5 _ 48: 89. 70, 10
        add     rax, 24                                 ; 004020F9 _ 48: 83. C0, 18
        mov     ecx, 48                                 ; 004020FD _ B9, 00000030
        mov     esi, 0                                  ; 00402102 _ BE, 00000000
        mov     qword [rax], rsi                        ; 00402107 _ 48: 89. 30
        mov     edx, ecx                                ; 0040210A _ 89. CA
        add     rdx, rax                                ; 0040210C _ 48: 01. C2
        add     rdx, 8                                  ; 0040210F _ 48: 83. C2, 08
        mov     qword [rdx-10H], rsi                    ; 00402113 _ 48: 89. 72, F0
        lea     rdx, [rax+8H]                           ; 00402117 _ 48: 8D. 50, 08
        and     rdx, 0FFFFFFFFFFFFFFF8H                 ; 0040211B _ 48: 83. E2, F8
        sub     rax, rdx                                ; 0040211F _ 48: 29. D0
        add     ecx, eax                                ; 00402122 _ 01. C1
        and     ecx, 0FFFFFFF8H                         ; 00402124 _ 83. E1, F8
        mov     eax, ecx                                ; 00402127 _ 89. C8
        shr     eax, 3                                  ; 00402129 _ C1. E8, 03
        mov     ecx, eax                                ; 0040212C _ 89. C1
        mov     rdi, rdx                                ; 0040212E _ 48: 89. D7
        mov     rax, rsi                                ; 00402131 _ 48: 89. F0
        rep stosq                                       ; 00402134 _ F3 48: AB
        mov     rax, qword [rbp-90H]                    ; 00402137 _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+48H], 0                      ; 0040213E _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-90H]                    ; 00402145 _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+4CH], 0                      ; 0040214C _ C7. 40, 4C, 00000000
        mov     eax, 0                                  ; 00402153 _ B8, 00000000
        jmp     ?_169                                   ; 00402158 _ E9, 00000577

?_142:  add     dword [rbp-78H], 1                      ; 0040215D _ 83. 45, 88, 01
?_143:  mov     rax, qword [rbp-88H]                    ; 00402161 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 00402168 _ 8B. 40, 10
        sub     eax, 1                                  ; 0040216B _ 83. E8, 01
        cmp     eax, dword [rbp-78H]                    ; 0040216E _ 3B. 45, 88
        jg      ?_141                                   ; 00402171 _ 0F 8F, FFFFFF1B
        mov     dword [rbp-7CH], 0                      ; 00402177 _ C7. 45, 84, 00000000
        jmp     ?_164                                   ; 0040217E _ E9, 000004AF

?_144:  call    ?_049                                   ; 00402183 _ E8, FFFFE938(rel)
        mov     ecx, eax                                ; 00402188 _ 89. C1
        mov     rax, qword [rbp-50H]                    ; 0040218A _ 48: 8B. 45, B0
        mov     edx, dword [rbp-7CH]                    ; 0040218E _ 8B. 55, 84
        movsxd  rdx, edx                                ; 00402191 _ 48: 63. D2
        mov     dword [rax+rdx*4], ecx                  ; 00402194 _ 89. 0C 90
        mov     rax, qword [rbp-50H]                    ; 00402197 _ 48: 8B. 45, B0
        mov     edx, dword [rbp-7CH]                    ; 0040219B _ 8B. 55, 84
        movsxd  rdx, edx                                ; 0040219E _ 48: 63. D2
        mov     eax, dword [rax+rdx*4]                  ; 004021A1 _ 8B. 04 90
        test    eax, eax                                ; 004021A4 _ 85. C0
        jne     ?_163                                   ; 004021A6 _ 0F 85, 00000482
        cmp     dword [rbp-7CH], 0                      ; 004021AC _ 83. 7D, 84, 00
        jne     ?_150                                   ; 004021B0 _ 0F 85, 0000019F
        mov     rax, qword [rbp-40H]                    ; 004021B6 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-7CH]                    ; 004021BA _ 8B. 55, 84
        movsxd  rdx, edx                                ; 004021BD _ 48: 63. D2
        mov     eax, dword [rax+rdx*8+4H]               ; 004021C0 _ 8B. 44 D0, 04
        mov     esi, 1                                  ; 004021C4 _ BE, 00000001
        mov     edi, eax                                ; 004021C9 _ 89. C7
        call    ?_015                                   ; 004021CB _ E8, FFFFE7E0(rel)
        mov     rax, qword [rbp-40H]                    ; 004021D0 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-7CH]                    ; 004021D4 _ 8B. 55, 84
        movsxd  rdx, edx                                ; 004021D7 _ 48: 63. D2
        mov     eax, dword [rax+rdx*8]                  ; 004021DA _ 8B. 04 D0
        mov     edi, eax                                ; 004021DD _ 89. C7
        call    ?_021                                   ; 004021DF _ E8, FFFFE7FC(rel)
        mov     dword [rbp-74H], 0                      ; 004021E4 _ C7. 45, 8C, 00000000
        jmp     ?_148                                   ; 004021EB _ EB, 38

?_145:  mov     eax, dword [rbp-74H]                    ; 004021ED _ 8B. 45, 8C
        cmp     eax, dword [rbp-7CH]                    ; 004021F0 _ 3B. 45, 84
        jz      ?_146                                   ; 004021F3 _ 74, 2B
        mov     rax, qword [rbp-40H]                    ; 004021F5 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-74H]                    ; 004021F9 _ 8B. 55, 8C
        movsxd  rdx, edx                                ; 004021FC _ 48: 63. D2
        mov     eax, dword [rax+rdx*8]                  ; 004021FF _ 8B. 04 D0
        mov     edi, eax                                ; 00402202 _ 89. C7
        call    ?_021                                   ; 00402204 _ E8, FFFFE7D7(rel)
        mov     rax, qword [rbp-40H]                    ; 00402209 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-74H]                    ; 0040220D _ 8B. 55, 8C
        movsxd  rdx, edx                                ; 00402210 _ 48: 63. D2
        mov     eax, dword [rax+rdx*8+4H]               ; 00402213 _ 8B. 44 D0, 04
        mov     edi, eax                                ; 00402217 _ 89. C7
        call    ?_021                                   ; 00402219 _ E8, FFFFE7C2(rel)
        jmp     ?_147                                   ; 0040221E _ EB, 01

?_146:  nop                                             ; 00402220 _ 90
?_147:  add     dword [rbp-74H], 1                      ; 00402221 _ 83. 45, 8C, 01
?_148:  mov     rax, qword [rbp-88H]                    ; 00402225 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 0040222C _ 8B. 40, 10
        sub     eax, 1                                  ; 0040222F _ 83. E8, 01
        cmp     eax, dword [rbp-74H]                    ; 00402232 _ 3B. 45, 8C
        jg      ?_145                                   ; 00402235 _ 7F, B6
        mov     rax, qword [rbp-88H]                    ; 00402237 _ 48: 8B. 85, FFFFFF78
        mov     rcx, qword [rax+8H]                     ; 0040223E _ 48: 8B. 48, 08
        mov     eax, dword [rbp-7CH]                    ; 00402242 _ 8B. 45, 84
        movsxd  rdx, eax                                ; 00402245 _ 48: 63. D0
        mov     rax, rdx                                ; 00402248 _ 48: 89. D0
        add     rax, rax                                ; 0040224B _ 48: 01. C0
        add     rax, rdx                                ; 0040224E _ 48: 01. D0
        shl     rax, 4                                  ; 00402251 _ 48: C1. E0, 04
        add     rax, rcx                                ; 00402255 _ 48: 01. C8
        mov     eax, dword [rax+18H]                    ; 00402258 _ 8B. 40, 18
        test    eax, eax                                ; 0040225B _ 85. C0
        je      ?_162                                   ; 0040225D _ 0F 84, 00000373
        mov     rax, qword [rbp-88H]                    ; 00402263 _ 48: 8B. 85, FFFFFF78
        mov     rcx, qword [rax+8H]                     ; 0040226A _ 48: 8B. 48, 08
        mov     eax, dword [rbp-7CH]                    ; 0040226E _ 8B. 45, 84
        movsxd  rdx, eax                                ; 00402271 _ 48: 63. D0
        mov     rax, rdx                                ; 00402274 _ 48: 89. D0
        add     rax, rax                                ; 00402277 _ 48: 01. C0
        add     rax, rdx                                ; 0040227A _ 48: 01. D0
        shl     rax, 4                                  ; 0040227D _ 48: C1. E0, 04
        add     rax, rcx                                ; 00402281 _ 48: 01. C8
        mov     rax, qword [rax+28H]                    ; 00402284 _ 48: 8B. 40, 28
        mov     esi, 0                                  ; 00402288 _ BE, 00000000
        mov     rdi, rax                                ; 0040228D _ 48: 89. C7
        mov     eax, 0                                  ; 00402290 _ B8, 00000000
        call    ?_041                                   ; 00402295 _ E8, FFFFE7E6(rel)
        mov     dword [rbp-64H], eax                    ; 0040229A _ 89. 45, 9C
        cmp     dword [rbp-64H], 0                      ; 0040229D _ 83. 7D, 9C, 00
        jns     ?_149                                   ; 004022A1 _ 0F 89, 00000090
        mov     rax, qword [rbp-90H]                    ; 004022A7 _ 48: 8B. 85, FFFFFF70
        mov     dword [rax], 1                          ; 004022AE _ C7. 00, 00000001
        mov     rax, qword [rbp-90H]                    ; 004022B4 _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+4H], 401                     ; 004022BB _ C7. 40, 04, 00000191
        mov     rax, qword [rbp-90H]                    ; 004022C2 _ 48: 8B. 85, FFFFFF70
        mov     rsi, qword 657220726F727245H            ; 004022C9 _ 48: BE, 657220726F727245
        mov     qword [rax+8H], rsi                     ; 004022D3 _ 48: 89. 70, 08
        mov     rsi, qword 6E69746365726964H            ; 004022D7 _ 48: BE, 6E69746365726964
        mov     qword [rax+10H], rsi                    ; 004022E1 _ 48: 89. 70, 10
        mov     rcx, qword 6C6966206F742067H            ; 004022E5 _ 48: B9, 6C6966206F742067
        mov     qword [rax+18H], rcx                    ; 004022EF _ 48: 89. 48, 18
        mov     qword [rax+20H], 11877                  ; 004022F3 _ 48: C7. 40, 20, 00002E65
        mov     qword [rax+28H], 0                      ; 004022FB _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 00402303 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 0040230B _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 00402313 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-90H]                    ; 0040231B _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+48H], 0                      ; 00402322 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-90H]                    ; 00402329 _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+4CH], 0                      ; 00402330 _ C7. 40, 4C, 00000000
?_149:  mov     eax, dword [rbp-64H]                    ; 00402337 _ 8B. 45, 9C
        mov     esi, 0                                  ; 0040233A _ BE, 00000000
        mov     edi, eax                                ; 0040233F _ 89. C7
        call    ?_015                                   ; 00402341 _ E8, FFFFE66A(rel)
        mov     eax, dword [rbp-64H]                    ; 00402346 _ 8B. 45, 9C
        mov     edi, eax                                ; 00402349 _ 89. C7
        call    ?_021                                   ; 0040234B _ E8, FFFFE690(rel)
        jmp     ?_162                                   ; 00402350 _ E9, 00000281

?_150:  mov     rax, qword [rbp-88H]                    ; 00402355 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 0040235C _ 8B. 40, 10
        sub     eax, 1                                  ; 0040235F _ 83. E8, 01
        cmp     eax, dword [rbp-7CH]                    ; 00402362 _ 3B. 45, 84
        jne     ?_156                                   ; 00402365 _ 0F 85, 000001AD
        mov     eax, dword [rbp-7CH]                    ; 0040236B _ 8B. 45, 84
        lea     edx, [rax-1H]                           ; 0040236E _ 8D. 50, FF
        mov     rax, qword [rbp-40H]                    ; 00402371 _ 48: 8B. 45, C0
        movsxd  rdx, edx                                ; 00402375 _ 48: 63. D2
        mov     eax, dword [rax+rdx*8]                  ; 00402378 _ 8B. 04 D0
        mov     esi, 0                                  ; 0040237B _ BE, 00000000
        mov     edi, eax                                ; 00402380 _ 89. C7
        call    ?_015                                   ; 00402382 _ E8, FFFFE629(rel)
        mov     eax, dword [rbp-7CH]                    ; 00402387 _ 8B. 45, 84
        lea     edx, [rax-1H]                           ; 0040238A _ 8D. 50, FF
        mov     rax, qword [rbp-40H]                    ; 0040238D _ 48: 8B. 45, C0
        movsxd  rdx, edx                                ; 00402391 _ 48: 63. D2
        mov     eax, dword [rax+rdx*8+4H]               ; 00402394 _ 8B. 44 D0, 04
        mov     edi, eax                                ; 00402398 _ 89. C7
        call    ?_021                                   ; 0040239A _ E8, FFFFE641(rel)
        mov     dword [rbp-70H], 0                      ; 0040239F _ C7. 45, 90, 00000000
        jmp     ?_154                                   ; 004023A6 _ EB, 3B

?_151:  mov     eax, dword [rbp-7CH]                    ; 004023A8 _ 8B. 45, 84
        sub     eax, 1                                  ; 004023AB _ 83. E8, 01
        cmp     eax, dword [rbp-70H]                    ; 004023AE _ 3B. 45, 90
        jz      ?_152                                   ; 004023B1 _ 74, 2B
        mov     rax, qword [rbp-40H]                    ; 004023B3 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-70H]                    ; 004023B7 _ 8B. 55, 90
        movsxd  rdx, edx                                ; 004023BA _ 48: 63. D2
        mov     eax, dword [rax+rdx*8]                  ; 004023BD _ 8B. 04 D0
        mov     edi, eax                                ; 004023C0 _ 89. C7
        call    ?_021                                   ; 004023C2 _ E8, FFFFE619(rel)
        mov     rax, qword [rbp-40H]                    ; 004023C7 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-70H]                    ; 004023CB _ 8B. 55, 90
        movsxd  rdx, edx                                ; 004023CE _ 48: 63. D2
        mov     eax, dword [rax+rdx*8+4H]               ; 004023D1 _ 8B. 44 D0, 04
        mov     edi, eax                                ; 004023D5 _ 89. C7
        call    ?_021                                   ; 004023D7 _ E8, FFFFE604(rel)
        jmp     ?_153                                   ; 004023DC _ EB, 01

?_152:  nop                                             ; 004023DE _ 90
?_153:  add     dword [rbp-70H], 1                      ; 004023DF _ 83. 45, 90, 01
?_154:  mov     rax, qword [rbp-88H]                    ; 004023E3 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 004023EA _ 8B. 40, 10
        sub     eax, 1                                  ; 004023ED _ 83. E8, 01
        cmp     eax, dword [rbp-70H]                    ; 004023F0 _ 3B. 45, 90
        jg      ?_151                                   ; 004023F3 _ 7F, B3
        mov     rax, qword [rbp-88H]                    ; 004023F5 _ 48: 8B. 85, FFFFFF78
        mov     rcx, qword [rax+8H]                     ; 004023FC _ 48: 8B. 48, 08
        mov     eax, dword [rbp-7CH]                    ; 00402400 _ 8B. 45, 84
        movsxd  rdx, eax                                ; 00402403 _ 48: 63. D0
        mov     rax, rdx                                ; 00402406 _ 48: 89. D0
        add     rax, rax                                ; 00402409 _ 48: 01. C0
        add     rax, rdx                                ; 0040240C _ 48: 01. D0
        shl     rax, 4                                  ; 0040240F _ 48: C1. E0, 04
        add     rax, rcx                                ; 00402413 _ 48: 01. C8
        mov     eax, dword [rax+14H]                    ; 00402416 _ 8B. 40, 14
        test    eax, eax                                ; 00402419 _ 85. C0
        je      ?_162                                   ; 0040241B _ 0F 84, 000001B5
        mov     rax, qword [rbp-88H]                    ; 00402421 _ 48: 8B. 85, FFFFFF78
        mov     rcx, qword [rax+8H]                     ; 00402428 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-7CH]                    ; 0040242C _ 8B. 45, 84
        movsxd  rdx, eax                                ; 0040242F _ 48: 63. D0
        mov     rax, rdx                                ; 00402432 _ 48: 89. D0
        add     rax, rax                                ; 00402435 _ 48: 01. C0
        add     rax, rdx                                ; 00402438 _ 48: 01. D0
        shl     rax, 4                                  ; 0040243B _ 48: C1. E0, 04
        add     rax, rcx                                ; 0040243F _ 48: 01. C8
        mov     rax, qword [rax+20H]                    ; 00402442 _ 48: 8B. 40, 20
        mov     edx, 432                                ; 00402446 _ BA, 000001B0
        mov     esi, 65                                 ; 0040244B _ BE, 00000041
        mov     rdi, rax                                ; 00402450 _ 48: 89. C7
        mov     eax, 0                                  ; 00402453 _ B8, 00000000
        call    ?_041                                   ; 00402458 _ E8, FFFFE623(rel)
        mov     dword [rbp-60H], eax                    ; 0040245D _ 89. 45, A0
        cmp     dword [rbp-60H], 0                      ; 00402460 _ 83. 7D, A0, 00
        jns     ?_155                                   ; 00402464 _ 0F 89, 00000090
        mov     rax, qword [rbp-90H]                    ; 0040246A _ 48: 8B. 85, FFFFFF70
        mov     dword [rax], 1                          ; 00402471 _ C7. 00, 00000001
        mov     rax, qword [rbp-90H]                    ; 00402477 _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+4H], 401                     ; 0040247E _ C7. 40, 04, 00000191
        mov     rax, qword [rbp-90H]                    ; 00402485 _ 48: 8B. 85, FFFFFF70
        mov     rsi, qword 657220726F727245H            ; 0040248C _ 48: BE, 657220726F727245
        mov     qword [rax+8H], rsi                     ; 00402496 _ 48: 89. 70, 08
        mov     rcx, qword 6E69746365726964H            ; 0040249A _ 48: B9, 6E69746365726964
        mov     qword [rax+10H], rcx                    ; 004024A4 _ 48: 89. 48, 10
        mov     rsi, qword 6C6966206F742067H            ; 004024A8 _ 48: BE, 6C6966206F742067
        mov     qword [rax+18H], rsi                    ; 004024B2 _ 48: 89. 70, 18
        mov     qword [rax+20H], 11877                  ; 004024B6 _ 48: C7. 40, 20, 00002E65
        mov     qword [rax+28H], 0                      ; 004024BE _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 004024C6 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 004024CE _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 004024D6 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-90H]                    ; 004024DE _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+48H], 0                      ; 004024E5 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-90H]                    ; 004024EC _ 48: 8B. 85, FFFFFF70
        mov     dword [rax+4CH], 0                      ; 004024F3 _ C7. 40, 4C, 00000000
?_155:  mov     eax, dword [rbp-60H]                    ; 004024FA _ 8B. 45, A0
        mov     esi, 1                                  ; 004024FD _ BE, 00000001
        mov     edi, eax                                ; 00402502 _ 89. C7
        call    ?_015                                   ; 00402504 _ E8, FFFFE4A7(rel)
        mov     eax, dword [rbp-60H]                    ; 00402509 _ 8B. 45, A0
        mov     edi, eax                                ; 0040250C _ 89. C7
        call    ?_021                                   ; 0040250E _ E8, FFFFE4CD(rel)
        jmp     ?_162                                   ; 00402513 _ E9, 000000BE

?_156:  mov     rax, qword [rbp-40H]                    ; 00402518 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-7CH]                    ; 0040251C _ 8B. 55, 84
        movsxd  rdx, edx                                ; 0040251F _ 48: 63. D2
        mov     eax, dword [rax+rdx*8+4H]               ; 00402522 _ 8B. 44 D0, 04
        mov     esi, 1                                  ; 00402526 _ BE, 00000001
        mov     edi, eax                                ; 0040252B _ 89. C7
        call    ?_015                                   ; 0040252D _ E8, FFFFE47E(rel)
        mov     eax, dword [rbp-7CH]                    ; 00402532 _ 8B. 45, 84
        lea     edx, [rax-1H]                           ; 00402535 _ 8D. 50, FF
        mov     rax, qword [rbp-40H]                    ; 00402538 _ 48: 8B. 45, C0
        movsxd  rdx, edx                                ; 0040253C _ 48: 63. D2
        mov     eax, dword [rax+rdx*8]                  ; 0040253F _ 8B. 04 D0
        mov     esi, 0                                  ; 00402542 _ BE, 00000000
        mov     edi, eax                                ; 00402547 _ 89. C7
        call    ?_015                                   ; 00402549 _ E8, FFFFE462(rel)
        mov     dword [rbp-6CH], 0                      ; 0040254E _ C7. 45, 94, 00000000
        jmp     ?_161                                   ; 00402555 _ EB, 6D

?_157:  mov     eax, dword [rbp-7CH]                    ; 00402557 _ 8B. 45, 84
        sub     eax, 1                                  ; 0040255A _ 83. E8, 01
        cmp     eax, dword [rbp-6CH]                    ; 0040255D _ 3B. 45, 94
        jnz     ?_158                                   ; 00402560 _ 75, 17
        mov     rax, qword [rbp-40H]                    ; 00402562 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-6CH]                    ; 00402566 _ 8B. 55, 94
        movsxd  rdx, edx                                ; 00402569 _ 48: 63. D2
        mov     eax, dword [rax+rdx*8+4H]               ; 0040256C _ 8B. 44 D0, 04
        mov     edi, eax                                ; 00402570 _ 89. C7
        call    ?_021                                   ; 00402572 _ E8, FFFFE469(rel)
        jmp     ?_160                                   ; 00402577 _ EB, 47

?_158:  mov     eax, dword [rbp-6CH]                    ; 00402579 _ 8B. 45, 94
        cmp     eax, dword [rbp-7CH]                    ; 0040257C _ 3B. 45, 84
        jnz     ?_159                                   ; 0040257F _ 75, 16
        mov     rax, qword [rbp-40H]                    ; 00402581 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-6CH]                    ; 00402585 _ 8B. 55, 94
        movsxd  rdx, edx                                ; 00402588 _ 48: 63. D2
        mov     eax, dword [rax+rdx*8]                  ; 0040258B _ 8B. 04 D0
        mov     edi, eax                                ; 0040258E _ 89. C7
        call    ?_021                                   ; 00402590 _ E8, FFFFE44B(rel)
        jmp     ?_160                                   ; 00402595 _ EB, 29

?_159:  mov     rax, qword [rbp-40H]                    ; 00402597 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-6CH]                    ; 0040259B _ 8B. 55, 94
        movsxd  rdx, edx                                ; 0040259E _ 48: 63. D2
        mov     eax, dword [rax+rdx*8]                  ; 004025A1 _ 8B. 04 D0
        mov     edi, eax                                ; 004025A4 _ 89. C7
        call    ?_021                                   ; 004025A6 _ E8, FFFFE435(rel)
        mov     rax, qword [rbp-40H]                    ; 004025AB _ 48: 8B. 45, C0
        mov     edx, dword [rbp-6CH]                    ; 004025AF _ 8B. 55, 94
        movsxd  rdx, edx                                ; 004025B2 _ 48: 63. D2
        mov     eax, dword [rax+rdx*8+4H]               ; 004025B5 _ 8B. 44 D0, 04
        mov     edi, eax                                ; 004025B9 _ 89. C7
        call    ?_021                                   ; 004025BB _ E8, FFFFE420(rel)
?_160:  add     dword [rbp-6CH], 1                      ; 004025C0 _ 83. 45, 94, 01
?_161:  mov     rax, qword [rbp-88H]                    ; 004025C4 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 004025CB _ 8B. 40, 10
        sub     eax, 1                                  ; 004025CE _ 83. E8, 01
        cmp     eax, dword [rbp-6CH]                    ; 004025D1 _ 3B. 45, 94
        jg      ?_157                                   ; 004025D4 _ 7F, 81
?_162:  mov     rax, qword [rbp-88H]                    ; 004025D6 _ 48: 8B. 85, FFFFFF78
        mov     rcx, qword [rax+8H]                     ; 004025DD _ 48: 8B. 48, 08
        mov     eax, dword [rbp-7CH]                    ; 004025E1 _ 8B. 45, 84
        movsxd  rdx, eax                                ; 004025E4 _ 48: 63. D0
        mov     rax, rdx                                ; 004025E7 _ 48: 89. D0
        add     rax, rax                                ; 004025EA _ 48: 01. C0
        add     rax, rdx                                ; 004025ED _ 48: 01. D0
        shl     rax, 4                                  ; 004025F0 _ 48: C1. E0, 04
        add     rax, rcx                                ; 004025F4 _ 48: 01. C8
        mov     rcx, qword [rax+8H]                     ; 004025F7 _ 48: 8B. 48, 08
        mov     rax, qword [rbp-88H]                    ; 004025FB _ 48: 8B. 85, FFFFFF78
        mov     rsi, qword [rax+8H]                     ; 00402602 _ 48: 8B. 70, 08
        mov     eax, dword [rbp-7CH]                    ; 00402606 _ 8B. 45, 84
        movsxd  rdx, eax                                ; 00402609 _ 48: 63. D0
        mov     rax, rdx                                ; 0040260C _ 48: 89. D0
        add     rax, rax                                ; 0040260F _ 48: 01. C0
        add     rax, rdx                                ; 00402612 _ 48: 01. D0
        shl     rax, 4                                  ; 00402615 _ 48: C1. E0, 04
        add     rax, rsi                                ; 00402619 _ 48: 01. F0
        mov     rax, qword [rax+8H]                     ; 0040261C _ 48: 8B. 40, 08
        mov     rax, qword [rax]                        ; 00402620 _ 48: 8B. 00
        mov     rsi, rcx                                ; 00402623 _ 48: 89. CE
        mov     rdi, rax                                ; 00402626 _ 48: 89. C7
        call    ?_045                                   ; 00402629 _ E8, FFFFE472(rel)
?_163:  add     dword [rbp-7CH], 1                      ; 0040262E _ 83. 45, 84, 01
?_164:  mov     rax, qword [rbp-88H]                    ; 00402632 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 00402639 _ 8B. 40, 10
        cmp     eax, dword [rbp-7CH]                    ; 0040263C _ 3B. 45, 84
        jg      ?_144                                   ; 0040263F _ 0F 8F, FFFFFB3E
        mov     dword [rbp-78H], 0                      ; 00402645 _ C7. 45, 88, 00000000
        jmp     ?_166                                   ; 0040264C _ EB, 33

?_165:  mov     rax, qword [rbp-40H]                    ; 0040264E _ 48: 8B. 45, C0
        mov     edx, dword [rbp-78H]                    ; 00402652 _ 8B. 55, 88
        movsxd  rdx, edx                                ; 00402655 _ 48: 63. D2
        mov     eax, dword [rax+rdx*8]                  ; 00402658 _ 8B. 04 D0
        mov     edi, eax                                ; 0040265B _ 89. C7
        call    ?_021                                   ; 0040265D _ E8, FFFFE37E(rel)
        mov     dword [rbp-5CH], eax                    ; 00402662 _ 89. 45, A4
        mov     rax, qword [rbp-40H]                    ; 00402665 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-78H]                    ; 00402669 _ 8B. 55, 88
        movsxd  rdx, edx                                ; 0040266C _ 48: 63. D2
        mov     eax, dword [rax+rdx*8+4H]               ; 0040266F _ 8B. 44 D0, 04
        mov     edi, eax                                ; 00402673 _ 89. C7
        call    ?_021                                   ; 00402675 _ E8, FFFFE366(rel)
        mov     dword [rbp-5CH], eax                    ; 0040267A _ 89. 45, A4
        add     dword [rbp-78H], 1                      ; 0040267D _ 83. 45, 88, 01
?_166:  mov     rax, qword [rbp-88H]                    ; 00402681 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 00402688 _ 8B. 40, 10
        sub     eax, 1                                  ; 0040268B _ 83. E8, 01
        cmp     eax, dword [rbp-78H]                    ; 0040268E _ 3B. 45, 88
        jg      ?_165                                   ; 00402691 _ 7F, BB
        mov     dword [rbp-7CH], 0                      ; 00402693 _ C7. 45, 84, 00000000
        jmp     ?_168                                   ; 0040269A _ EB, 24

?_167:  mov     rax, qword [rbp-50H]                    ; 0040269C _ 48: 8B. 45, B0
        mov     edx, dword [rbp-7CH]                    ; 004026A0 _ 8B. 55, 84
        movsxd  rdx, edx                                ; 004026A3 _ 48: 63. D2
        mov     eax, dword [rax+rdx*4]                  ; 004026A6 _ 8B. 04 90
        lea     rcx, [rbp-80H]                          ; 004026A9 _ 48: 8D. 4D, 80
        mov     edx, 0                                  ; 004026AD _ BA, 00000000
        mov     rsi, rcx                                ; 004026B2 _ 48: 89. CE
        mov     edi, eax                                ; 004026B5 _ 89. C7
        call    ?_039                                   ; 004026B7 _ E8, FFFFE3B4(rel)
        add     dword [rbp-7CH], 1                      ; 004026BC _ 83. 45, 84, 01
?_168:  mov     rax, qword [rbp-88H]                    ; 004026C0 _ 48: 8B. 85, FFFFFF78
        mov     eax, dword [rax+10H]                    ; 004026C7 _ 8B. 40, 10
        cmp     eax, dword [rbp-7CH]                    ; 004026CA _ 3B. 45, 84
        jg      ?_167                                   ; 004026CD _ 7F, CD
        mov     eax, 1                                  ; 004026CF _ B8, 00000001
?_169:  mov     rsp, rbx                                ; 004026D4 _ 48: 89. DC
        cmp     eax, 1                                  ; 004026D7 _ 83. F8, 01
        jmp     ?_171                                   ; 004026DA _ EB, 01

?_170:  nop                                             ; 004026DC _ 90
?_171:  mov     rax, qword [rbp-38H]                    ; 004026DD _ 48: 8B. 45, C8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rax, qword [fs:abs 28H]                 ; 004026E1 _ 64 48: 33. 04 25, 00000028
        jz      ?_172                                   ; 004026EA _ 74, 05
        call    ?_013                                   ; 004026EC _ E8, FFFFE2AF(rel)
?_172:  lea     rsp, [rbp-28H]                          ; 004026F1 _ 48: 8D. 65, D8
        pop     rbx                                     ; 004026F5 _ 5B
        pop     r12                                     ; 004026F6 _ 41: 5C
        pop     r13                                     ; 004026F8 _ 41: 5D
        pop     r14                                     ; 004026FA _ 41: 5E
        pop     r15                                     ; 004026FC _ 41: 5F
        pop     rbp                                     ; 004026FE _ 5D
        ret                                             ; 004026FF _ C3
; SetUpAndExecute End of function

CheckPipingRules:; Function begin
        push    rbp                                     ; 00402700 _ 55
        mov     rbp, rsp                                ; 00402701 _ 48: 89. E5
        mov     qword [rbp-18H], rdi                    ; 00402704 _ 48: 89. 7D, E8
        mov     qword [rbp-20H], rsi                    ; 00402708 _ 48: 89. 75, E0
        mov     rax, qword [rbp-18H]                    ; 0040270C _ 48: 8B. 45, E8
        mov     eax, dword [rax+10H]                    ; 00402710 _ 8B. 40, 10
        cmp     eax, 1                                  ; 00402713 _ 83. F8, 01
        je      ?_179                                   ; 00402716 _ 0F 84, 000002A0
        mov     dword [rbp-4H], 0                       ; 0040271C _ C7. 45, FC, 00000000
        jmp     ?_178                                   ; 00402723 _ E9, 00000284

?_173:  cmp     dword [rbp-4H], 0                       ; 00402728 _ 83. 7D, FC, 00
        jne     ?_174                                   ; 0040272C _ 0F 85, 000000C1
        mov     rax, qword [rbp-18H]                    ; 00402732 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 00402736 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-4H]                     ; 0040273A _ 8B. 45, FC
        movsxd  rdx, eax                                ; 0040273D _ 48: 63. D0
        mov     rax, rdx                                ; 00402740 _ 48: 89. D0
        add     rax, rax                                ; 00402743 _ 48: 01. C0
        add     rax, rdx                                ; 00402746 _ 48: 01. D0
        shl     rax, 4                                  ; 00402749 _ 48: C1. E0, 04
        add     rax, rcx                                ; 0040274D _ 48: 01. C8
        mov     eax, dword [rax+14H]                    ; 00402750 _ 8B. 40, 14
        test    eax, eax                                ; 00402753 _ 85. C0
        je      ?_177                                   ; 00402755 _ 0F 84, 0000024D
        mov     rax, qword [rbp-20H]                    ; 0040275B _ 48: 8B. 45, E0
        mov     dword [rax], 1                          ; 0040275F _ C7. 00, 00000001
        mov     rax, qword [rbp-20H]                    ; 00402765 _ 48: 8B. 45, E0
        mov     dword [rax+4H], 122                     ; 00402769 _ C7. 40, 04, 0000007A
        mov     rax, qword [rbp-20H]                    ; 00402770 _ 48: 8B. 45, E0
        mov     rsi, qword 45207861746E7953H            ; 00402774 _ 48: BE, 45207861746E7953
        mov     qword [rax+8H], rsi                     ; 0040277E _ 48: 89. 70, 08
        mov     rdi, qword 49202D20726F7272H            ; 00402782 _ 48: BF, 49202D20726F7272
        mov     qword [rax+10H], rdi                    ; 0040278C _ 48: 89. 78, 10
        mov     rsi, qword 50206C6167656C6CH            ; 00402790 _ 48: BE, 50206C6167656C6C
        mov     qword [rax+18H], rsi                    ; 0040279A _ 48: 89. 70, 18
        mov     rdi, qword 696465522F657069H            ; 0040279E _ 48: BF, 696465522F657069
        mov     qword [rax+20H], rdi                    ; 004027A8 _ 48: 89. 78, 20
        mov     rsi, qword 6D6F432074636572H            ; 004027AC _ 48: BE, 6D6F432074636572
        mov     qword [rax+28H], rsi                    ; 004027B6 _ 48: 89. 70, 28
        mov     rdi, qword 6E6F6974616E6962H            ; 004027BA _ 48: BF, 6E6F6974616E6962
        mov     qword [rax+30H], rdi                    ; 004027C4 _ 48: 89. 78, 30
        mov     qword [rax+38H], 46                     ; 004027C8 _ 48: C7. 40, 38, 0000002E
        mov     qword [rax+40H], 0                      ; 004027D0 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-20H]                    ; 004027D8 _ 48: 8B. 45, E0
        mov     dword [rax+48H], 0                      ; 004027DC _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-20H]                    ; 004027E3 _ 48: 8B. 45, E0
        mov     dword [rax+4CH], 0                      ; 004027E7 _ C7. 40, 4C, 00000000
        jmp     ?_177                                   ; 004027EE _ E9, 000001B5

?_174:  mov     rax, qword [rbp-18H]                    ; 004027F3 _ 48: 8B. 45, E8
        mov     eax, dword [rax+10H]                    ; 004027F7 _ 8B. 40, 10
        sub     eax, 1                                  ; 004027FA _ 83. E8, 01
        cmp     eax, dword [rbp-4H]                     ; 004027FD _ 3B. 45, FC
        jne     ?_175                                   ; 00402800 _ 0F 85, 000000C1
        mov     rax, qword [rbp-18H]                    ; 00402806 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 0040280A _ 48: 8B. 48, 08
        mov     eax, dword [rbp-4H]                     ; 0040280E _ 8B. 45, FC
        movsxd  rdx, eax                                ; 00402811 _ 48: 63. D0
        mov     rax, rdx                                ; 00402814 _ 48: 89. D0
        add     rax, rax                                ; 00402817 _ 48: 01. C0
        add     rax, rdx                                ; 0040281A _ 48: 01. D0
        shl     rax, 4                                  ; 0040281D _ 48: C1. E0, 04
        add     rax, rcx                                ; 00402821 _ 48: 01. C8
        mov     eax, dword [rax+18H]                    ; 00402824 _ 8B. 40, 18
        test    eax, eax                                ; 00402827 _ 85. C0
        je      ?_177                                   ; 00402829 _ 0F 84, 00000179
        mov     rax, qword [rbp-20H]                    ; 0040282F _ 48: 8B. 45, E0
        mov     dword [rax], 1                          ; 00402833 _ C7. 00, 00000001
        mov     rax, qword [rbp-20H]                    ; 00402839 _ 48: 8B. 45, E0
        mov     dword [rax+4H], 122                     ; 0040283D _ C7. 40, 04, 0000007A
        mov     rax, qword [rbp-20H]                    ; 00402844 _ 48: 8B. 45, E0
        mov     rsi, qword 45207861746E7953H            ; 00402848 _ 48: BE, 45207861746E7953
        mov     qword [rax+8H], rsi                     ; 00402852 _ 48: 89. 70, 08
        mov     rdi, qword 49202D20726F7272H            ; 00402856 _ 48: BF, 49202D20726F7272
        mov     qword [rax+10H], rdi                    ; 00402860 _ 48: 89. 78, 10
        mov     rcx, qword 50206C6167656C6CH            ; 00402864 _ 48: B9, 50206C6167656C6C
        mov     qword [rax+18H], rcx                    ; 0040286E _ 48: 89. 48, 18
        mov     rsi, qword 696465522F657069H            ; 00402872 _ 48: BE, 696465522F657069
        mov     qword [rax+20H], rsi                    ; 0040287C _ 48: 89. 70, 20
        mov     rdi, qword 6D6F432074636572H            ; 00402880 _ 48: BF, 6D6F432074636572
        mov     qword [rax+28H], rdi                    ; 0040288A _ 48: 89. 78, 28
        mov     rcx, qword 6E6F6974616E6962H            ; 0040288E _ 48: B9, 6E6F6974616E6962
        mov     qword [rax+30H], rcx                    ; 00402898 _ 48: 89. 48, 30
        mov     qword [rax+38H], 46                     ; 0040289C _ 48: C7. 40, 38, 0000002E
        mov     qword [rax+40H], 0                      ; 004028A4 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-20H]                    ; 004028AC _ 48: 8B. 45, E0
        mov     dword [rax+48H], 0                      ; 004028B0 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-20H]                    ; 004028B7 _ 48: 8B. 45, E0
        mov     dword [rax+4CH], 0                      ; 004028BB _ C7. 40, 4C, 00000000
        jmp     ?_177                                   ; 004028C2 _ E9, 000000E1

?_175:  mov     rax, qword [rbp-18H]                    ; 004028C7 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 004028CB _ 48: 8B. 48, 08
        mov     eax, dword [rbp-4H]                     ; 004028CF _ 8B. 45, FC
        movsxd  rdx, eax                                ; 004028D2 _ 48: 63. D0
        mov     rax, rdx                                ; 004028D5 _ 48: 89. D0
        add     rax, rax                                ; 004028D8 _ 48: 01. C0
        add     rax, rdx                                ; 004028DB _ 48: 01. D0
        shl     rax, 4                                  ; 004028DE _ 48: C1. E0, 04
        add     rax, rcx                                ; 004028E2 _ 48: 01. C8
        mov     eax, dword [rax+18H]                    ; 004028E5 _ 8B. 40, 18
        test    eax, eax                                ; 004028E8 _ 85. C0
        jnz     ?_176                                   ; 004028EA _ 75, 29
        mov     rax, qword [rbp-18H]                    ; 004028EC _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 004028F0 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-4H]                     ; 004028F4 _ 8B. 45, FC
        movsxd  rdx, eax                                ; 004028F7 _ 48: 63. D0
        mov     rax, rdx                                ; 004028FA _ 48: 89. D0
        add     rax, rax                                ; 004028FD _ 48: 01. C0
        add     rax, rdx                                ; 00402900 _ 48: 01. D0
        shl     rax, 4                                  ; 00402903 _ 48: C1. E0, 04
        add     rax, rcx                                ; 00402907 _ 48: 01. C8
        mov     eax, dword [rax+14H]                    ; 0040290A _ 8B. 40, 14
        test    eax, eax                                ; 0040290D _ 85. C0
        je      ?_177                                   ; 0040290F _ 0F 84, 00000093
?_176:  mov     rax, qword [rbp-20H]                    ; 00402915 _ 48: 8B. 45, E0
        mov     dword [rax], 1                          ; 00402919 _ C7. 00, 00000001
        mov     rax, qword [rbp-20H]                    ; 0040291F _ 48: 8B. 45, E0
        mov     dword [rax+4H], 122                     ; 00402923 _ C7. 40, 04, 0000007A
        mov     rax, qword [rbp-20H]                    ; 0040292A _ 48: 8B. 45, E0
        mov     rsi, qword 45207861746E7953H            ; 0040292E _ 48: BE, 45207861746E7953
        mov     qword [rax+8H], rsi                     ; 00402938 _ 48: 89. 70, 08
        mov     rdi, qword 49202D20726F7272H            ; 0040293C _ 48: BF, 49202D20726F7272
        mov     qword [rax+10H], rdi                    ; 00402946 _ 48: 89. 78, 10
        mov     rdx, qword 50206C6167656C6CH            ; 0040294A _ 48: BA, 50206C6167656C6C
        mov     qword [rax+18H], rdx                    ; 00402954 _ 48: 89. 50, 18
        mov     rcx, qword 696465522F657069H            ; 00402958 _ 48: B9, 696465522F657069
        mov     qword [rax+20H], rcx                    ; 00402962 _ 48: 89. 48, 20
        mov     rsi, qword 6D6F432074636572H            ; 00402966 _ 48: BE, 6D6F432074636572
        mov     qword [rax+28H], rsi                    ; 00402970 _ 48: 89. 70, 28
        mov     rdi, qword 6E6F6974616E6962H            ; 00402974 _ 48: BF, 6E6F6974616E6962
        mov     qword [rax+30H], rdi                    ; 0040297E _ 48: 89. 78, 30
        mov     qword [rax+38H], 46                     ; 00402982 _ 48: C7. 40, 38, 0000002E
        mov     qword [rax+40H], 0                      ; 0040298A _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-20H]                    ; 00402992 _ 48: 8B. 45, E0
        mov     dword [rax+48H], 0                      ; 00402996 _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-20H]                    ; 0040299D _ 48: 8B. 45, E0
        mov     dword [rax+4CH], 0                      ; 004029A1 _ C7. 40, 4C, 00000000
?_177:  add     dword [rbp-4H], 1                       ; 004029A8 _ 83. 45, FC, 01
?_178:  mov     rax, qword [rbp-18H]                    ; 004029AC _ 48: 8B. 45, E8
        mov     eax, dword [rax+10H]                    ; 004029B0 _ 8B. 40, 10
        cmp     eax, dword [rbp-4H]                     ; 004029B3 _ 3B. 45, FC
        jg      ?_173                                   ; 004029B6 _ 0F 8F, FFFFFD6C
?_179:  nop                                             ; 004029BC _ 90
        pop     rbp                                     ; 004029BD _ 5D
        ret                                             ; 004029BE _ C3
; CheckPipingRules End of function

SppChdir:; Function begin
        push    rbp                                     ; 004029BF _ 55
        mov     rbp, rsp                                ; 004029C0 _ 48: 89. E5
        sub     rsp, 32                                 ; 004029C3 _ 48: 83. EC, 20
        mov     qword [rbp-18H], rdi                    ; 004029C7 _ 48: 89. 7D, E8
        mov     qword [rbp-20H], rsi                    ; 004029CB _ 48: 89. 75, E0
        mov     rax, qword [rbp-18H]                    ; 004029CF _ 48: 8B. 45, E8
        mov     rax, qword [rax+8H]                     ; 004029D3 _ 48: 8B. 40, 08
        mov     rax, qword [rax+8H]                     ; 004029D7 _ 48: 8B. 40, 08
        add     rax, 8                                  ; 004029DB _ 48: 83. C0, 08
        mov     rax, qword [rax]                        ; 004029DF _ 48: 8B. 00
        test    rax, rax                                ; 004029E2 _ 48: 85. C0
        jne     ?_180                                   ; 004029E5 _ 0F 85, 00000086
        mov     rax, qword [rbp-20H]                    ; 004029EB _ 48: 8B. 45, E0
        mov     dword [rax], 1                          ; 004029EF _ C7. 00, 00000001
        mov     rax, qword [rbp-20H]                    ; 004029F5 _ 48: 8B. 45, E0
        mov     dword [rax+4H], 502                     ; 004029F9 _ C7. 40, 04, 000001F6
        mov     rax, qword [rbp-20H]                    ; 00402A00 _ 48: 8B. 45, E0
        mov     rdx, qword 20646E616D6D6F43H            ; 00402A04 _ 48: BA, 20646E616D6D6F43
        mov     qword [rax+8H], rdx                     ; 00402A0E _ 48: 89. 50, 08
        mov     rcx, qword 7165722027646327H            ; 00402A12 _ 48: B9, 7165722027646327
        mov     qword [rax+10H], rcx                    ; 00402A1C _ 48: 89. 48, 10
        mov     rsi, qword 7461702073656975H            ; 00402A20 _ 48: BE, 7461702073656975
        mov     qword [rax+18H], rsi                    ; 00402A2A _ 48: 89. 70, 18
        mov     qword [rax+20H], 11880                  ; 00402A2E _ 48: C7. 40, 20, 00002E68
        mov     qword [rax+28H], 0                      ; 00402A36 _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 00402A3E _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 00402A46 _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 00402A4E _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-20H]                    ; 00402A56 _ 48: 8B. 45, E0
        mov     dword [rax+48H], 0                      ; 00402A5A _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-20H]                    ; 00402A61 _ 48: 8B. 45, E0
        mov     dword [rax+4CH], 0                      ; 00402A65 _ C7. 40, 4C, 00000000
        jmp     ?_181                                   ; 00402A6C _ E9, 000000AF

?_180:  mov     rax, qword [rbp-18H]                    ; 00402A71 _ 48: 8B. 45, E8
        mov     rax, qword [rax+8H]                     ; 00402A75 _ 48: 8B. 40, 08
        mov     rax, qword [rax+8H]                     ; 00402A79 _ 48: 8B. 40, 08
        add     rax, 8                                  ; 00402A7D _ 48: 83. C0, 08
        mov     rax, qword [rax]                        ; 00402A81 _ 48: 8B. 00
        mov     rdi, rax                                ; 00402A84 _ 48: 89. C7
        call    ?_011                                   ; 00402A87 _ E8, FFFFDF04(rel)
        mov     dword [rbp-4H], eax                     ; 00402A8C _ 89. 45, FC
        cmp     dword [rbp-4H], 0                       ; 00402A8F _ 83. 7D, FC, 00
        je      ?_181                                   ; 00402A93 _ 0F 84, 00000087
        mov     rax, qword [rbp-20H]                    ; 00402A99 _ 48: 8B. 45, E0
        mov     dword [rax], 1                          ; 00402A9D _ C7. 00, 00000001
        mov     rax, qword [rbp-20H]                    ; 00402AA3 _ 48: 8B. 45, E0
        mov     dword [rax+4H], 501                     ; 00402AA7 _ C7. 40, 04, 000001F5
        mov     rax, qword [rbp-20H]                    ; 00402AAE _ 48: 8B. 45, E0
        mov     rdx, qword 6F6E20646C756F43H            ; 00402AB2 _ 48: BA, 6F6E20646C756F43
        mov     qword [rax+8H], rdx                     ; 00402ABC _ 48: 89. 50, 08
        mov     rcx, qword 206F742064632074H            ; 00402AC0 _ 48: B9, 206F742064632074
        mov     qword [rax+10H], rcx                    ; 00402ACA _ 48: 89. 48, 10
        mov     rdi, qword 6569666963657073H            ; 00402ACE _ 48: BF, 6569666963657073
        mov     qword [rax+18H], rdi                    ; 00402AD8 _ 48: 89. 78, 18
        mov     rsi, qword 2E687461702064H              ; 00402ADC _ 48: BE, 002E687461702064
        mov     qword [rax+20H], rsi                    ; 00402AE6 _ 48: 89. 70, 20
        mov     qword [rax+28H], 0                      ; 00402AEA _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 00402AF2 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 00402AFA _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 00402B02 _ 48: C7. 40, 40, 00000000
        mov     rax, qword [rbp-20H]                    ; 00402B0A _ 48: 8B. 45, E0
        mov     dword [rax+48H], 0                      ; 00402B0E _ C7. 40, 48, 00000000
        mov     rax, qword [rbp-20H]                    ; 00402B15 _ 48: 8B. 45, E0
        mov     dword [rax+4CH], 0                      ; 00402B19 _ C7. 40, 4C, 00000000
?_181:  nop                                             ; 00402B20 _ 90
        leave                                           ; 00402B21 _ C9
        ret                                             ; 00402B22 _ C3
; SppChdir End of function

SppExit:; Function begin
        push    rbp                                     ; 00402B23 _ 55
        mov     rbp, rsp                                ; 00402B24 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 00402B27 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 00402B2B _ 48: 89. 75, F0
        mov     rax, qword [rbp-10H]                    ; 00402B2F _ 48: 8B. 45, F0
        mov     dword [rax], 0                          ; 00402B33 _ C7. 00, 00000000
        mov     rax, qword [rbp-10H]                    ; 00402B39 _ 48: 8B. 45, F0
        mov     dword [rax+4H], 0                       ; 00402B3D _ C7. 40, 04, 00000000
        mov     rax, qword [rbp-10H]                    ; 00402B44 _ 48: 8B. 45, F0
        mov     rdi, qword 21657962646F6F47H            ; 00402B48 _ 48: BF, 21657962646F6F47
        mov     qword [rax+8H], rdi                     ; 00402B52 _ 48: 89. 78, 08
        mov     qword [rax+10H], 0                      ; 00402B56 _ 48: C7. 40, 10, 00000000
        add     rax, 24                                 ; 00402B5E _ 48: 83. C0, 18
        mov     ecx, 48                                 ; 00402B62 _ B9, 00000030
        mov     esi, 0                                  ; 00402B67 _ BE, 00000000
        mov     qword [rax], rsi                        ; 00402B6C _ 48: 89. 30
        mov     edx, ecx                                ; 00402B6F _ 89. CA
        add     rdx, rax                                ; 00402B71 _ 48: 01. C2
        add     rdx, 8                                  ; 00402B74 _ 48: 83. C2, 08
        mov     qword [rdx-10H], rsi                    ; 00402B78 _ 48: 89. 72, F0
        lea     rdx, [rax+8H]                           ; 00402B7C _ 48: 8D. 50, 08
        and     rdx, 0FFFFFFFFFFFFFFF8H                 ; 00402B80 _ 48: 83. E2, F8
        sub     rax, rdx                                ; 00402B84 _ 48: 29. D0
        add     ecx, eax                                ; 00402B87 _ 01. C1
        and     ecx, 0FFFFFFF8H                         ; 00402B89 _ 83. E1, F8
        mov     eax, ecx                                ; 00402B8C _ 89. C8
        shr     eax, 3                                  ; 00402B8E _ C1. E8, 03
        mov     ecx, eax                                ; 00402B91 _ 89. C1
        mov     rdi, rdx                                ; 00402B93 _ 48: 89. D7
        mov     rax, rsi                                ; 00402B96 _ 48: 89. F0
        rep stosq                                       ; 00402B99 _ F3 48: AB
        mov     rax, qword [rbp-10H]                    ; 00402B9C _ 48: 8B. 45, F0
        mov     dword [rax+48H], 1                      ; 00402BA0 _ C7. 40, 48, 00000001
        mov     rax, qword [rbp-10H]                    ; 00402BA7 _ 48: 8B. 45, F0
        mov     dword [rax+4CH], 0                      ; 00402BAB _ C7. 40, 4C, 00000000
        nop                                             ; 00402BB2 _ 90
        pop     rbp                                     ; 00402BB3 _ 5D
        ret                                             ; 00402BB4 _ C3
; SppExit End of function

SppHelp:; Function begin
        push    rbp                                     ; 00402BB5 _ 55
        mov     rbp, rsp                                ; 00402BB6 _ 48: 89. E5
        sub     rsp, 16                                 ; 00402BB9 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 00402BBD _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 00402BC1 _ 48: 89. 75, F0
        mov     edi, ?_194                              ; 00402BC5 _ BF, 00402DB8(d)
        call    ?_007                                   ; 00402BCA _ E8, FFFFDDA1(rel)
        mov     edi, ?_195                              ; 00402BCF _ BF, 00402DC1(d)
        call    ?_007                                   ; 00402BD4 _ E8, FFFFDD97(rel)
        mov     edi, ?_196                              ; 00402BD9 _ BF, 00402DD0(d)
        call    ?_007                                   ; 00402BDE _ E8, FFFFDD8D(rel)
        nop                                             ; 00402BE3 _ 90
        leave                                           ; 00402BE4 _ C9
        ret                                             ; 00402BE5 _ C3
; SppHelp End of function

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

__libc_csu_init:; Function begin
        push    r15                                     ; 00402BF0 _ 41: 57
        push    r14                                     ; 00402BF2 _ 41: 56
        mov     r15d, edi                               ; 00402BF4 _ 41: 89. FF
        push    r13                                     ; 00402BF7 _ 41: 55
        push    r12                                     ; 00402BF9 _ 41: 54
        lea     r12, [rel __frame_dummy_init_array_entry]; 00402BFB _ 4C: 8D. 25, 0020120E(rel)
        push    rbp                                     ; 00402C02 _ 55
        lea     rbp, [rel __do_global_dtors_aux_fini_array_entry]; 00402C03 _ 48: 8D. 2D, 0020120E(rel)
        push    rbx                                     ; 00402C0A _ 53
        mov     r14, rsi                                ; 00402C0B _ 49: 89. F6
        mov     r13, rdx                                ; 00402C0E _ 49: 89. D5
        sub     rbp, r12                                ; 00402C11 _ 4C: 29. E5
        sub     rsp, 8                                  ; 00402C14 _ 48: 83. EC, 08
        sar     rbp, 3                                  ; 00402C18 _ 48: C1. FD, 03
        call    _init                                   ; 00402C1C _ E8, FFFFDCFF(rel)
        test    rbp, rbp                                ; 00402C21 _ 48: 85. ED
        jz      ?_183                                   ; 00402C24 _ 74, 20
        xor     ebx, ebx                                ; 00402C26 _ 31. DB
; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_182:  mov     rdx, r13                                ; 00402C30 _ 4C: 89. EA
        mov     rsi, r14                                ; 00402C33 _ 4C: 89. F6
        mov     edi, r15d                               ; 00402C36 _ 44: 89. FF
        call    near [r12+rbx*8]                        ; 00402C39 _ 41: FF. 14 DC
        add     rbx, 1                                  ; 00402C3D _ 48: 83. C3, 01
        cmp     rbx, rbp                                ; 00402C41 _ 48: 39. EB
        jnz     ?_182                                   ; 00402C44 _ 75, EA
?_183:  add     rsp, 8                                  ; 00402C46 _ 48: 83. C4, 08
        pop     rbx                                     ; 00402C4A _ 5B
        pop     rbp                                     ; 00402C4B _ 5D
        pop     r12                                     ; 00402C4C _ 41: 5C
        pop     r13                                     ; 00402C4E _ 41: 5D
        pop     r14                                     ; 00402C50 _ 41: 5E
        pop     r15                                     ; 00402C52 _ 41: 5F
        ret                                             ; 00402C54 _ C3
; __libc_csu_init End of function

        nop                                             ; 00402C55 _ 90
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

__libc_csu_fini:; Function begin
        DB      0F3H                                    ; Prefix coded explicitly
        ret                                             ; 00402C60 _ F3: C3
; __libc_csu_fini End of function


SECTION .fini   align=4 execute                         ; section number 15, code

_fini:  ; Function begin
        sub     rsp, 8                                  ; 00402C64 _ 48: 83. EC, 08
        add     rsp, 8                                  ; 00402C68 _ 48: 83. C4, 08
        ret                                             ; 00402C6C _ C3
; _fini End of function


SECTION .rodata align=8 noexecute                       ; section number 16, const

_IO_stdin_used:                                         ; dword
        dd 00020001H, 00000000H                         ; 00402C70 _ 131073 0 

?_184:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H, 63H, 64H, 00H       ; 00402C78 _ exit.cd.
        db 68H, 65H, 6CH, 70H, 00H, 00H, 00H, 00H       ; 00402C80 _ help....

?_185:                                                  ; byte
        db 73H, 68H, 65H, 6CH, 6CH, 2BH, 2BH, 0AH       ; 00402C88 _ shell++.
        db 4AH, 61H, 6BH, 65H, 20H, 53H, 61H, 6CH       ; 00402C90 _ Jake Sal
        db 74H, 7AH, 6DH, 61H, 6EH, 0AH, 43H, 53H       ; 00402C98 _ tzman.CS
        db 34H, 34H, 31H, 34H, 20H, 53H, 70H, 72H       ; 00402CA0 _ 4414 Spr
        db 69H, 6EH, 67H, 20H, 32H, 30H, 31H, 37H       ; 00402CA8 _ ing 2017
        db 0AH, 00H                                     ; 00402CB0 _ ..

?_186:                                                  ; byte
        db 73H, 70H, 70H, 24H, 20H, 00H                 ; 00402CB2 _ spp$ .

?_187:                                                  ; byte
        db 25H, 73H, 00H                                ; 00402CB8 _ %s.

?_188:                                                  ; byte
        db 7CH, 00H, 00H, 00H, 00H                      ; 00402CBB _ |....

?_189:                                                  ; switch/case jump table
        dq ?_060                                        ; 00402CC0 _ 0000000000400D0F (d)
        dq ?_064                                        ; 00402CC8 _ 0000000000400DDE (d)
        dq ?_065                                        ; 00402CD0 _ 0000000000400E14 (d)
        dq ?_068                                        ; 00402CD8 _ 0000000000400E68 (d)
        dq ?_081                                        ; 00402CE0 _ 0000000000401208 (d)
        dq ?_061                                        ; 00402CE8 _ 0000000000400D3D (d)
        dq ?_074                                        ; 00402CF0 _ 0000000000401042 (d)
        dq ?_089                                        ; 00402CF8 _ 000000000040142A (d)

?_190:                                                  ; byte
        db 5EH, 5BH, 41H, 2DH, 5AH, 61H, 2DH, 7AH       ; 00402D00 _ ^[A-Za-z
        db 30H, 2DH, 39H, 5BH, 3AH, 73H, 70H, 61H       ; 00402D08 _ 0-9[:spa
        db 63H, 65H, 3AH, 5DH, 5CH, 2EH, 5CH, 5FH       ; 00402D10 _ ce:]\.\_
        db 5CH, 2DH, 5DH, 2BH, 28H, 5BH, 3CH, 7CH       ; 00402D18 _ \-]+([<|
        db 3EH, 5DH, 3FH, 5BH, 5BH, 3AH, 73H, 70H       ; 00402D20 _ >]?[[:sp
        db 61H, 63H, 65H, 3AH, 5DH, 5DH, 2AH, 5BH       ; 00402D28 _ ace:]]*[
        db 41H, 2DH, 5AH, 61H, 2DH, 7AH, 30H, 2DH       ; 00402D30 _ A-Za-z0-
        db 39H, 5CH, 2EH, 5FH, 5DH, 2BH, 5BH, 41H       ; 00402D38 _ 9\._]+[A
        db 2DH, 5AH, 61H, 2DH, 7AH, 30H, 2DH, 39H       ; 00402D40 _ -Za-z0-9
        db 5BH, 3AH, 73H, 70H, 61H, 63H, 65H, 3AH       ; 00402D48 _ [:space:
        db 5DH, 5CH, 2EH, 5CH, 5FH, 5CH, 2DH, 5DH       ; 00402D50 _ ]\.\_\-]
        db 2AH, 29H, 2AH, 24H, 00H                      ; 00402D58 _ *)*$.

?_191:                                                  ; byte
        db 45H, 52H, 52H, 4FH, 52H, 20H, 25H, 64H       ; 00402D5D _ ERROR %d
        db 3AH, 20H, 25H, 73H, 0AH, 00H                 ; 00402D65 _ : %s..

?_192:                                                  ; byte
        db 20H, 00H, 00H, 00H, 00H                      ; 00402D6B _  ....

?_193:                                                  ; switch/case jump table
        dq ?_119                                        ; 00402D70 _ 0000000000401A9C (d)
        dq ?_120                                        ; 00402D78 _ 0000000000401ADB (d)
        dq ?_125                                        ; 00402D80 _ 0000000000401B5A (d)
        dq ?_127                                        ; 00402D88 _ 0000000000401BB0 (d)
        dq ?_126                                        ; 00402D90 _ 0000000000401B71 (d)
        dq ?_128                                        ; 00402D98 _ 0000000000401BC7 (d)
        dq ?_129                                        ; 00402DA0 _ 0000000000401C06 (d)
        dq ?_130                                        ; 00402DA8 _ 0000000000401C88 (d)
        dq ?_131                                        ; 00402DB0 _ 0000000000401CB0 (d)

?_194:                                                  ; byte
        db 53H, 50H, 50H, 20H, 48H, 45H, 4CH, 50H       ; 00402DB8 _ SPP HELP
        db 00H                                          ; 00402DC0 _ .

?_195:                                                  ; byte
        db 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH       ; 00402DC1 _ --------
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H            ; 00402DC9 _ .......

?_196:                                                  ; byte
        db 54H, 79H, 70H, 65H, 20H, 63H, 6FH, 6DH       ; 00402DD0 _ Type com
        db 6DH, 61H, 6EH, 64H, 73H, 21H, 20H, 4FH       ; 00402DD8 _ mands! O
        db 74H, 68H, 65H, 72H, 20H, 6FH, 70H, 74H       ; 00402DE0 _ ther opt
        db 69H, 6FH, 6EH, 73H, 20H, 61H, 72H, 65H       ; 00402DE8 _ ions are
        db 20H, 63H, 64H, 20H, 61H, 6EH, 64H, 20H       ; 00402DF0 _  cd and 
        db 65H, 78H, 69H, 74H, 00H                      ; 00402DF8 _ exit.


SECTION .eh_frame_hdr align=4 noexecute                 ; section number 17, const

__GNU_EH_FRAME_HDR:                                     ; byte
        db 01H, 1BH, 03H, 3BH, 0A4H, 00H, 00H, 00H      ; 00402E00 _ ...;....
        db 13H, 00H, 00H, 00H, 40H, 0DBH, 0FFH, 0FFH    ; 00402E08 _ ....@...
        db 0F0H, 00H, 00H, 00H, 0E0H, 0DCH, 0FFH, 0FFH  ; 00402E10 _ ........
        db 0C0H, 00H, 00H, 00H, 0D6H, 0DDH, 0FFH, 0FFH  ; 00402E18 _ ........
        db 18H, 01H, 00H, 00H, 0F5H, 0DDH, 0FFH, 0FFH   ; 00402E20 _ ........
        db 38H, 01H, 00H, 00H, 0BDH, 0DEH, 0FFH, 0FFH   ; 00402E28 _ 8.......
        db 58H, 01H, 00H, 00H, 58H, 0E6H, 0FFH, 0FFH    ; 00402E30 _ X...X...
        db 80H, 01H, 00H, 00H, 7FH, 0E7H, 0FFH, 0FFH    ; 00402E38 _ ........
        db 0A0H, 01H, 00H, 00H, 2CH, 0EBH, 0FFH, 0FFH   ; 00402E40 _ ....,...
        db 0C0H, 01H, 00H, 00H, 7CH, 0EBH, 0FFH, 0FFH   ; 00402E48 _ ....|...
        db 0E0H, 01H, 00H, 00H, 66H, 0ECH, 0FFH, 0FFH   ; 00402E50 _ ....f...
        db 00H, 02H, 00H, 00H, 0C2H, 0EEH, 0FFH, 0FFH   ; 00402E58 _ ........
        db 28H, 02H, 00H, 00H, 3FH, 0EFH, 0FFH, 0FFH    ; 00402E60 _ (...?...
        db 48H, 02H, 00H, 00H, 62H, 0F1H, 0FFH, 0FFH    ; 00402E68 _ H...b...
        db 68H, 02H, 00H, 00H, 00H, 0F9H, 0FFH, 0FFH    ; 00402E70 _ h.......
        db 98H, 02H, 00H, 00H, 0BFH, 0FBH, 0FFH, 0FFH   ; 00402E78 _ ........
        db 0B8H, 02H, 00H, 00H, 23H, 0FDH, 0FFH, 0FFH   ; 00402E80 _ ....#...
        db 0D8H, 02H, 00H, 00H, 0B5H, 0FDH, 0FFH, 0FFH  ; 00402E88 _ ........
        db 0F8H, 02H, 00H, 00H, 0F0H, 0FDH, 0FFH, 0FFH  ; 00402E90 _ ........
        db 18H, 03H, 00H, 00H, 60H, 0FEH, 0FFH, 0FFH    ; 00402E98 _ ....`...
        db 60H, 03H, 00H, 00H                           ; 00402EA0 _ `...


SECTION .eh_frame align=8 noexecute                     ; section number 18, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00402EA8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 00402EB0 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 07H, 10H       ; 00402EB8 _ ........
        db 14H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 00402EC0 _ ........
        db 18H, 0DCH, 0FFH, 0FFH, 2AH, 00H, 00H, 00H    ; 00402EC8 _ ....*...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00402ED0 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00402ED8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 00402EE0 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 00402EE8 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 00402EF0 _ $.......
        db 48H, 0DAH, 0FFH, 0FFH, 90H, 01H, 00H, 00H    ; 00402EF8 _ H.......
        db 00H, 0EH, 10H, 46H, 0EH, 18H, 4AH, 0FH       ; 00402F00 _ ...F..J.
        db 0BH, 77H, 08H, 80H, 00H, 3FH, 1AH, 3BH       ; 00402F08 _ .w...?.;
        db 2AH, 33H, 24H, 22H, 00H, 00H, 00H, 00H       ; 00402F10 _ *3$"....
        db 1CH, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 00402F18 _ ....D...
        db 0B6H, 0DCH, 0FFH, 0FFH, 1FH, 00H, 00H, 00H   ; 00402F20 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00402F28 _ .A....C.
        db 06H, 5AH, 0CH, 07H, 08H, 00H, 00H, 00H       ; 00402F30 _ .Z......
        db 1CH, 00H, 00H, 00H, 64H, 00H, 00H, 00H       ; 00402F38 _ ....d...
        db 0B5H, 0DCH, 0FFH, 0FFH, 0C8H, 00H, 00H, 00H  ; 00402F40 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00402F48 _ .A....C.
        db 06H, 02H, 0C3H, 0CH, 07H, 08H, 00H, 00H      ; 00402F50 _ ........
        db 24H, 00H, 00H, 00H, 84H, 00H, 00H, 00H       ; 00402F58 _ $.......
        db 5DH, 0DDH, 0FFH, 0FFH, 9BH, 07H, 00H, 00H    ; 00402F60 _ ].......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00402F68 _ .A....C.
        db 06H, 45H, 83H, 03H, 03H, 91H, 07H, 0CH       ; 00402F70 _ .E......
        db 07H, 08H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00402F78 _ ........
        db 1CH, 00H, 00H, 00H, 0ACH, 00H, 00H, 00H      ; 00402F80 _ ........
        db 0D0H, 0E4H, 0FFH, 0FFH, 27H, 01H, 00H, 00H   ; 00402F88 _ ....'...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00402F90 _ .A....C.
        db 06H, 03H, 22H, 01H, 0CH, 07H, 08H, 00H       ; 00402F98 _ ..".....
        db 1CH, 00H, 00H, 00H, 0CCH, 00H, 00H, 00H      ; 00402FA0 _ ........
        db 0D7H, 0E5H, 0FFH, 0FFH, 0ADH, 03H, 00H, 00H  ; 00402FA8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00402FB0 _ .A....C.
        db 06H, 03H, 0A8H, 03H, 0CH, 07H, 08H, 00H      ; 00402FB8 _ ........
        db 1CH, 00H, 00H, 00H, 0ECH, 00H, 00H, 00H      ; 00402FC0 _ ........
        db 64H, 0E9H, 0FFH, 0FFH, 50H, 00H, 00H, 00H    ; 00402FC8 _ d...P...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00402FD0 _ .A....C.
        db 06H, 02H, 4BH, 0CH, 07H, 08H, 00H, 00H       ; 00402FD8 _ ..K.....
        db 1CH, 00H, 00H, 00H, 0CH, 01H, 00H, 00H       ; 00402FE0 _ ........
        db 94H, 0E9H, 0FFH, 0FFH, 0EAH, 00H, 00H, 00H   ; 00402FE8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00402FF0 _ .A....C.
        db 06H, 02H, 0E5H, 0CH, 07H, 08H, 00H, 00H      ; 00402FF8 _ ........
        db 24H, 00H, 00H, 00H, 2CH, 01H, 00H, 00H       ; 00403000 _ $...,...
        db 5EH, 0EAH, 0FFH, 0FFH, 5CH, 02H, 00H, 00H    ; 00403008 _ ^...\...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00403010 _ .A....C.
        db 06H, 45H, 83H, 03H, 03H, 52H, 02H, 0CH       ; 00403018 _ .E...R..
        db 07H, 08H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00403020 _ ........
        db 1CH, 00H, 00H, 00H, 54H, 01H, 00H, 00H       ; 00403028 _ ....T...
        db 92H, 0ECH, 0FFH, 0FFH, 7DH, 00H, 00H, 00H    ; 00403030 _ ....}...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00403038 _ .A....C.
        db 06H, 02H, 78H, 0CH, 07H, 08H, 00H, 00H       ; 00403040 _ ..x.....
        db 1CH, 00H, 00H, 00H, 74H, 01H, 00H, 00H       ; 00403048 _ ....t...
        db 0EFH, 0ECH, 0FFH, 0FFH, 23H, 02H, 00H, 00H   ; 00403050 _ ....#...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00403058 _ .A....C.
        db 06H, 03H, 1EH, 02H, 0CH, 07H, 08H, 00H       ; 00403060 _ ........
        db 2CH, 00H, 00H, 00H, 94H, 01H, 00H, 00H       ; 00403068 _ ,.......
        db 0F2H, 0EEH, 0FFH, 0FFH, 9EH, 07H, 00H, 00H   ; 00403070 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00403078 _ .A....C.
        db 06H, 4DH, 8FH, 03H, 8EH, 04H, 8DH, 05H       ; 00403080 _ .M......
        db 8CH, 06H, 83H, 07H, 03H, 8CH, 07H, 0CH       ; 00403088 _ ........
        db 07H, 08H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00403090 _ ........
        db 1CH, 00H, 00H, 00H, 0C4H, 01H, 00H, 00H      ; 00403098 _ ........
        db 60H, 0F6H, 0FFH, 0FFH, 0BFH, 02H, 00H, 00H   ; 004030A0 _ `.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 004030A8 _ .A....C.
        db 06H, 03H, 0BAH, 02H, 0CH, 07H, 08H, 00H      ; 004030B0 _ ........
        db 1CH, 00H, 00H, 00H, 0E4H, 01H, 00H, 00H      ; 004030B8 _ ........
        db 0FFH, 0F8H, 0FFH, 0FFH, 64H, 01H, 00H, 00H   ; 004030C0 _ ....d...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 004030C8 _ .A....C.
        db 06H, 03H, 5FH, 01H, 0CH, 07H, 08H, 00H       ; 004030D0 _ .._.....
        db 1CH, 00H, 00H, 00H, 04H, 02H, 00H, 00H       ; 004030D8 _ ........
        db 43H, 0FAH, 0FFH, 0FFH, 92H, 00H, 00H, 00H    ; 004030E0 _ C.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 004030E8 _ .A....C.
        db 06H, 02H, 8DH, 0CH, 07H, 08H, 00H, 00H       ; 004030F0 _ ........
        db 1CH, 00H, 00H, 00H, 24H, 02H, 00H, 00H       ; 004030F8 _ ....$...
        db 0B5H, 0FAH, 0FFH, 0FFH, 31H, 00H, 00H, 00H   ; 00403100 _ ....1...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00403108 _ .A....C.
        db 06H, 6CH, 0CH, 07H, 08H, 00H, 00H, 00H       ; 00403110 _ .l......
        db 44H, 00H, 00H, 00H, 44H, 02H, 00H, 00H       ; 00403118 _ D...D...
        db 0D0H, 0FAH, 0FFH, 0FFH, 65H, 00H, 00H, 00H   ; 00403120 _ ....e...
        db 00H, 42H, 0EH, 10H, 8FH, 02H, 42H, 0EH       ; 00403128 _ .B....B.
        db 18H, 8EH, 03H, 45H, 0EH, 20H, 8DH, 04H       ; 00403130 _ ...E. ..
        db 42H, 0EH, 28H, 8CH, 05H, 48H, 0EH, 30H       ; 00403138 _ B.(..H.0
        db 86H, 06H, 48H, 0EH, 38H, 83H, 07H, 4DH       ; 00403140 _ ..H.8..M
        db 0EH, 40H, 72H, 0EH, 38H, 41H, 0EH, 30H       ; 00403148 _ .@r.8A.0
        db 41H, 0EH, 28H, 42H, 0EH, 20H, 42H, 0EH       ; 00403150 _ A.(B. B.
        db 18H, 42H, 0EH, 10H, 42H, 0EH, 08H, 00H       ; 00403158 _ .B..B...
        db 14H, 00H, 00H, 00H, 8CH, 02H, 00H, 00H       ; 00403160 _ ........
        db 0F8H, 0FAH, 0FFH, 0FFH, 02H, 00H, 00H, 00H   ; 00403168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00403170 _ ........

__FRAME_END__:                                          ; byte
        db 00H, 00H, 00H, 00H                           ; 00403178 _ ....


SECTION .init_array align=8 noexecute                   ; section number 19, data

__init_array_start:                                     ; qword
__frame_dummy_init_array_entry:                         ; virtual table or function pointer
        dq frame_dummy                                  ; 00603E10 _ 0000000000400BB0 (d)


SECTION .fini_array align=8 noexecute                   ; section number 20, data

__init_array_end:                                       ; byte
__do_global_dtors_aux_fini_array_entry:                 ; byte
        db 90H, 0BH, 40H, 00H, 00H, 00H, 00H, 00H       ; 00603E18 _ ..@.....


SECTION .jcr    align=8 noexecute                       ; section number 21, data

__JCR_END__:                                            ; byte
__JCR_LIST__:                                           ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E20 _ ........


SECTION .dynamic align=8 noexecute                      ; section number 22, data

_DYNAMIC:                                               ; byte
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E28 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E30 _ ........
        db 0CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E38 _ ........
        db 20H, 09H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00603E40 _  .@.....
        db 0DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E48 _ ........
        db 64H, 2CH, 40H, 00H, 00H, 00H, 00H, 00H       ; 00603E50 _ d,@.....
        db 19H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E58 _ ........
        db 10H, 3EH, 60H, 00H, 00H, 00H, 00H, 00H       ; 00603E60 _ .>`.....
        db 1BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E68 _ ........
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E70 _ ........
        db 1AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E78 _ ........
        db 18H, 3EH, 60H, 00H, 00H, 00H, 00H, 00H       ; 00603E80 _ .>`.....
        db 1CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E88 _ ........
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603E90 _ ........
        db 0F5H, 0FEH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 00603E98 _ ...o....
        db 98H, 02H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00603EA0 _ ..@.....
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603EA8 _ ........
        db 48H, 05H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00603EB0 _ H.@.....
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603EB8 _ ........
        db 0C0H, 02H, 40H, 00H, 00H, 00H, 00H, 00H      ; 00603EC0 _ ..@.....
        db 0AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603EC8 _ ........
        db 0F2H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 00603ED0 _ ........
        db 0BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603ED8 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603EE0 _ ........
        db 15H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603EE8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603EF0 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603EF8 _ ........
        db 00H, 40H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00603F00 _ .@`.....
        db 02H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F08 _ ........
        db 40H, 02H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F10 _ @.......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F18 _ ........
        db 07H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F20 _ ........
        db 17H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F28 _ ........
        db 0E0H, 06H, 40H, 00H, 00H, 00H, 00H, 00H      ; 00603F30 _ ..@.....
        db 07H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F38 _ ........
        db 0B0H, 06H, 40H, 00H, 00H, 00H, 00H, 00H      ; 00603F40 _ ..@.....
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F48 _ ........
        db 30H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F50 _ 0.......
        db 09H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F58 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F60 _ ........
        db 0FEH, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 00603F68 _ ...o....
        db 70H, 06H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00603F70 _ p.@.....
        db 0FFH, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 00603F78 _ ...o....
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F80 _ ........
        db 0F0H, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 00603F88 _ ...o....
        db 3AH, 06H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00603F90 _ :.@.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603F98 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FA0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FA8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FB0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FB8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FC0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FC8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FD0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FD8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FE0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FE8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00603FF0 _ ........


SECTION .got    align=8 noexecute                       ; section number 23, data

?_197:                                                  ; switch/case jump table
        dd __gmon_start__                               ; 00603FF8 _ 00000000 (GOT)
        dd 00000000H                                    ; 00603FFC _ 00000000 


SECTION .got.plt align=8 noexecute                      ; section number 24, data

_GLOBAL_OFFSET_TABLE_:                                  ; byte
        db 28H, 3EH, 60H, 00H, 00H, 00H, 00H, 00H       ; 00604000 _ (>`.....

?_198:                                                  ; qword
        dq 0000000000000000H                            ; 00604008 _ 0000000000000000 

?_199:                                                  ; switch/case jump table
        dq 0000000000000000H                            ; 00604010 _ 0000000000000000 

?_200:                                                  ; switch/case jump table
        dq ?_004                                        ; 00604018 _ 0000000000400956 (d)

?_201:                                                  ; switch/case jump table
        dq ?_006                                        ; 00604020 _ 0000000000400966 (d)

?_202:                                                  ; switch/case jump table
        dq ?_008                                        ; 00604028 _ 0000000000400976 (d)

?_203:                                                  ; switch/case jump table
        dq ?_010                                        ; 00604030 _ 0000000000400986 (d)

?_204:                                                  ; switch/case jump table
        dq ?_012                                        ; 00604038 _ 0000000000400996 (d)

?_205:                                                  ; switch/case jump table
        dq ?_014                                        ; 00604040 _ 00000000004009A6 (d)

?_206:                                                  ; switch/case jump table
        dq ?_016                                        ; 00604048 _ 00000000004009B6 (d)

?_207:                                                  ; switch/case jump table
        dq ?_018                                        ; 00604050 _ 00000000004009C6 (d)

?_208:                                                  ; switch/case jump table
        dq ?_020                                        ; 00604058 _ 00000000004009D6 (d)

?_209:                                                  ; switch/case jump table
        dq ?_022                                        ; 00604060 _ 00000000004009E6 (d)

?_210:                                                  ; switch/case jump table
        dq ?_024                                        ; 00604068 _ 00000000004009F6 (d)

?_211:                                                  ; switch/case jump table
        dq ?_026                                        ; 00604070 _ 0000000000400A06 (d)

?_212:                                                  ; switch/case jump table
        dq ?_028                                        ; 00604078 _ 0000000000400A16 (d)

?_213:                                                  ; switch/case jump table
        dq ?_030                                        ; 00604080 _ 0000000000400A26 (d)

?_214:                                                  ; switch/case jump table
        dq ?_032                                        ; 00604088 _ 0000000000400A36 (d)

?_215:                                                  ; switch/case jump table
        dq ?_034                                        ; 00604090 _ 0000000000400A46 (d)

?_216:                                                  ; switch/case jump table
        dq ?_036                                        ; 00604098 _ 0000000000400A56 (d)

?_217:                                                  ; switch/case jump table
        dq ?_038                                        ; 006040A0 _ 0000000000400A66 (d)

?_218:                                                  ; switch/case jump table
        dq ?_040                                        ; 006040A8 _ 0000000000400A76 (d)

?_219:                                                  ; switch/case jump table
        dq ?_042                                        ; 006040B0 _ 0000000000400A86 (d)

?_220:                                                  ; switch/case jump table
        dq ?_044                                        ; 006040B8 _ 0000000000400A96 (d)

?_221:                                                  ; switch/case jump table
        dq ?_046                                        ; 006040C0 _ 0000000000400AA6 (d)

?_222:                                                  ; switch/case jump table
        dq ?_048                                        ; 006040C8 _ 0000000000400AB6 (d)

?_223:                                                  ; switch/case jump table
        dq ?_050                                        ; 006040D0 _ 0000000000400AC6 (d)


SECTION .data   align=16 noexecute                      ; section number 25, data

__data_start:                                           ; byte
data_start:                                             ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 006040E0 _ ........

__dso_handle:                                           ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 006040E8 _ ........

sppcommand_strings:                                     ; byte
        dq 0000000000402C78H                            ; 006040F0 _ 0000000000402C78 
        dq 0000000000402C7DH                            ; 006040F8 _ 0000000000402C7D 
        dq 0000000000402C80H                            ; 00604100 _ 0000000000402C80 
        dq 0000000000000000H                            ; 00604108 _ 0000000000000000 

SppCommands:                                            ; virtual table or function pointer
        dq SppExit                                      ; 00604110 _ 0000000000402B23 (d)
        dq SppChdir                                     ; 00604118 _ 00000000004029BF (d)
        dq SppHelp                                      ; 00604120 _ 0000000000402BB5 (d)


SECTION .bss    align=32 noexecute                      ; section number 26, bss

stdin@@GLIBC_2.2.5:                                     ; qword
stdin:  resq    1                                       ; 00604140

completed.7585:                                         ; byte
        resb    24                                      ; 00604148

pregex:                                                 ; zword
        resb    64                                      ; 00604160


; Error: Relocation number 185 has a non-existing source address. Section: 26 Offset: 00000000H

