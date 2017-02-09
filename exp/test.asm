
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000400448 <_init>:
  400448:	48 83 ec 08          	sub    $0x8,%rsp
  40044c:	48 8b 05 a5 0b 20 00 	mov    0x200ba5(%rip),%rax        # 600ff8 <_DYNAMIC+0x1d0>
  400453:	48 85 c0             	test   %rax,%rax
  400456:	74 05                	je     40045d <_init+0x15>
  400458:	e8 53 00 00 00       	callq  4004b0 <__printf_chk@plt+0x10>
  40045d:	48 83 c4 08          	add    $0x8,%rsp
  400461:	c3                   	retq   

Disassembly of section .plt:

0000000000400470 <__stack_chk_fail@plt-0x10>:
  400470:	ff 35 92 0b 20 00    	pushq  0x200b92(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400476:	ff 25 94 0b 20 00    	jmpq   *0x200b94(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40047c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400480 <__stack_chk_fail@plt>:
  400480:	ff 25 92 0b 20 00    	jmpq   *0x200b92(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400486:	68 00 00 00 00       	pushq  $0x0
  40048b:	e9 e0 ff ff ff       	jmpq   400470 <_init+0x28>

0000000000400490 <__libc_start_main@plt>:
  400490:	ff 25 8a 0b 20 00    	jmpq   *0x200b8a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400496:	68 01 00 00 00       	pushq  $0x1
  40049b:	e9 d0 ff ff ff       	jmpq   400470 <_init+0x28>

00000000004004a0 <__printf_chk@plt>:
  4004a0:	ff 25 82 0b 20 00    	jmpq   *0x200b82(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  4004a6:	68 02 00 00 00       	pushq  $0x2
  4004ab:	e9 c0 ff ff ff       	jmpq   400470 <_init+0x28>

Disassembly of section .plt.got:

00000000004004b0 <.plt.got>:
  4004b0:	ff 25 42 0b 20 00    	jmpq   *0x200b42(%rip)        # 600ff8 <_DYNAMIC+0x1d0>
  4004b6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000004004c0 <main>:
  4004c0:	55                   	push   %rbp
  4004c1:	53                   	push   %rbx
  4004c2:	48 83 ec 38          	sub    $0x38,%rsp
  4004c6:	66 0f 28 05 02 02 00 	movapd 0x202(%rip),%xmm0        # 4006d0 <_IO_stdin_used+0x10>
  4004cd:	00 
  4004ce:	48 8d 6c 24 20       	lea    0x20(%rsp),%rbp
  4004d3:	48 89 e3             	mov    %rsp,%rbx
  4004d6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4004dd:	00 00 
  4004df:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  4004e4:	31 c0                	xor    %eax,%eax
  4004e6:	0f 29 04 24          	movaps %xmm0,(%rsp)
  4004ea:	66 0f 28 05 ee 01 00 	movapd 0x1ee(%rip),%xmm0        # 4006e0 <_IO_stdin_used+0x20>
  4004f1:	00 
  4004f2:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  4004f7:	be c4 06 40 00       	mov    $0x4006c4,%esi
  4004fc:	bf 01 00 00 00       	mov    $0x1,%edi
  400501:	b8 01 00 00 00       	mov    $0x1,%eax
  400506:	48 83 c3 08          	add    $0x8,%rbx
  40050a:	f2 0f 10 43 f8       	movsd  -0x8(%rbx),%xmm0
  40050f:	e8 8c ff ff ff       	callq  4004a0 <__printf_chk@plt>
  400514:	48 39 dd             	cmp    %rbx,%rbp
  400517:	75 de                	jne    4004f7 <main+0x37>
  400519:	31 c0                	xor    %eax,%eax
  40051b:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  400520:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  400527:	00 00 
  400529:	75 07                	jne    400532 <main+0x72>
  40052b:	48 83 c4 38          	add    $0x38,%rsp
  40052f:	5b                   	pop    %rbx
  400530:	5d                   	pop    %rbp
  400531:	c3                   	retq   
  400532:	e8 49 ff ff ff       	callq  400480 <__stack_chk_fail@plt>
  400537:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40053e:	00 00 

0000000000400540 <_start>:
  400540:	31 ed                	xor    %ebp,%ebp
  400542:	49 89 d1             	mov    %rdx,%r9
  400545:	5e                   	pop    %rsi
  400546:	48 89 e2             	mov    %rsp,%rdx
  400549:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40054d:	50                   	push   %rax
  40054e:	54                   	push   %rsp
  40054f:	49 c7 c0 b0 06 40 00 	mov    $0x4006b0,%r8
  400556:	48 c7 c1 40 06 40 00 	mov    $0x400640,%rcx
  40055d:	48 c7 c7 c0 04 40 00 	mov    $0x4004c0,%rdi
  400564:	e8 27 ff ff ff       	callq  400490 <__libc_start_main@plt>
  400569:	f4                   	hlt    
  40056a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400570 <deregister_tm_clones>:
  400570:	b8 47 10 60 00       	mov    $0x601047,%eax
  400575:	55                   	push   %rbp
  400576:	48 2d 40 10 60 00    	sub    $0x601040,%rax
  40057c:	48 83 f8 0e          	cmp    $0xe,%rax
  400580:	48 89 e5             	mov    %rsp,%rbp
  400583:	76 1b                	jbe    4005a0 <deregister_tm_clones+0x30>
  400585:	b8 00 00 00 00       	mov    $0x0,%eax
  40058a:	48 85 c0             	test   %rax,%rax
  40058d:	74 11                	je     4005a0 <deregister_tm_clones+0x30>
  40058f:	5d                   	pop    %rbp
  400590:	bf 40 10 60 00       	mov    $0x601040,%edi
  400595:	ff e0                	jmpq   *%rax
  400597:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40059e:	00 00 
  4005a0:	5d                   	pop    %rbp
  4005a1:	c3                   	retq   
  4005a2:	0f 1f 40 00          	nopl   0x0(%rax)
  4005a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4005ad:	00 00 00 

00000000004005b0 <register_tm_clones>:
  4005b0:	be 40 10 60 00       	mov    $0x601040,%esi
  4005b5:	55                   	push   %rbp
  4005b6:	48 81 ee 40 10 60 00 	sub    $0x601040,%rsi
  4005bd:	48 c1 fe 03          	sar    $0x3,%rsi
  4005c1:	48 89 e5             	mov    %rsp,%rbp
  4005c4:	48 89 f0             	mov    %rsi,%rax
  4005c7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4005cb:	48 01 c6             	add    %rax,%rsi
  4005ce:	48 d1 fe             	sar    %rsi
  4005d1:	74 15                	je     4005e8 <register_tm_clones+0x38>
  4005d3:	b8 00 00 00 00       	mov    $0x0,%eax
  4005d8:	48 85 c0             	test   %rax,%rax
  4005db:	74 0b                	je     4005e8 <register_tm_clones+0x38>
  4005dd:	5d                   	pop    %rbp
  4005de:	bf 40 10 60 00       	mov    $0x601040,%edi
  4005e3:	ff e0                	jmpq   *%rax
  4005e5:	0f 1f 00             	nopl   (%rax)
  4005e8:	5d                   	pop    %rbp
  4005e9:	c3                   	retq   
  4005ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004005f0 <__do_global_dtors_aux>:
  4005f0:	80 3d 49 0a 20 00 00 	cmpb   $0x0,0x200a49(%rip)        # 601040 <__TMC_END__>
  4005f7:	75 11                	jne    40060a <__do_global_dtors_aux+0x1a>
  4005f9:	55                   	push   %rbp
  4005fa:	48 89 e5             	mov    %rsp,%rbp
  4005fd:	e8 6e ff ff ff       	callq  400570 <deregister_tm_clones>
  400602:	5d                   	pop    %rbp
  400603:	c6 05 36 0a 20 00 01 	movb   $0x1,0x200a36(%rip)        # 601040 <__TMC_END__>
  40060a:	f3 c3                	repz retq 
  40060c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400610 <frame_dummy>:
  400610:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  400615:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400619:	75 05                	jne    400620 <frame_dummy+0x10>
  40061b:	eb 93                	jmp    4005b0 <register_tm_clones>
  40061d:	0f 1f 00             	nopl   (%rax)
  400620:	b8 00 00 00 00       	mov    $0x0,%eax
  400625:	48 85 c0             	test   %rax,%rax
  400628:	74 f1                	je     40061b <frame_dummy+0xb>
  40062a:	55                   	push   %rbp
  40062b:	48 89 e5             	mov    %rsp,%rbp
  40062e:	ff d0                	callq  *%rax
  400630:	5d                   	pop    %rbp
  400631:	e9 7a ff ff ff       	jmpq   4005b0 <register_tm_clones>
  400636:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40063d:	00 00 00 

0000000000400640 <__libc_csu_init>:
  400640:	41 57                	push   %r15
  400642:	41 56                	push   %r14
  400644:	41 89 ff             	mov    %edi,%r15d
  400647:	41 55                	push   %r13
  400649:	41 54                	push   %r12
  40064b:	4c 8d 25 be 07 20 00 	lea    0x2007be(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  400652:	55                   	push   %rbp
  400653:	48 8d 2d be 07 20 00 	lea    0x2007be(%rip),%rbp        # 600e18 <__init_array_end>
  40065a:	53                   	push   %rbx
  40065b:	49 89 f6             	mov    %rsi,%r14
  40065e:	49 89 d5             	mov    %rdx,%r13
  400661:	4c 29 e5             	sub    %r12,%rbp
  400664:	48 83 ec 08          	sub    $0x8,%rsp
  400668:	48 c1 fd 03          	sar    $0x3,%rbp
  40066c:	e8 d7 fd ff ff       	callq  400448 <_init>
  400671:	48 85 ed             	test   %rbp,%rbp
  400674:	74 20                	je     400696 <__libc_csu_init+0x56>
  400676:	31 db                	xor    %ebx,%ebx
  400678:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40067f:	00 
  400680:	4c 89 ea             	mov    %r13,%rdx
  400683:	4c 89 f6             	mov    %r14,%rsi
  400686:	44 89 ff             	mov    %r15d,%edi
  400689:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40068d:	48 83 c3 01          	add    $0x1,%rbx
  400691:	48 39 eb             	cmp    %rbp,%rbx
  400694:	75 ea                	jne    400680 <__libc_csu_init+0x40>
  400696:	48 83 c4 08          	add    $0x8,%rsp
  40069a:	5b                   	pop    %rbx
  40069b:	5d                   	pop    %rbp
  40069c:	41 5c                	pop    %r12
  40069e:	41 5d                	pop    %r13
  4006a0:	41 5e                	pop    %r14
  4006a2:	41 5f                	pop    %r15
  4006a4:	c3                   	retq   
  4006a5:	90                   	nop
  4006a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4006ad:	00 00 00 

00000000004006b0 <__libc_csu_fini>:
  4006b0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004006b4 <_fini>:
  4006b4:	48 83 ec 08          	sub    $0x8,%rsp
  4006b8:	48 83 c4 08          	add    $0x8,%rsp
  4006bc:	c3                   	retq   
