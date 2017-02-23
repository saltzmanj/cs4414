
./spp:     file format elf64-x86-64


Disassembly of section .init:

0000000000400810 <_init>:
  400810:	48 83 ec 08          	sub    $0x8,%rsp
  400814:	48 8b 05 dd 17 20 00 	mov    0x2017dd(%rip),%rax        # 601ff8 <_DYNAMIC+0x1d0>
  40081b:	48 85 c0             	test   %rax,%rax
  40081e:	74 05                	je     400825 <_init+0x15>
  400820:	e8 4b 01 00 00       	callq  400970 <fork@plt+0x10>
  400825:	48 83 c4 08          	add    $0x8,%rsp
  400829:	c3                   	retq   

Disassembly of section .plt:

0000000000400830 <free@plt-0x10>:
  400830:	ff 35 d2 17 20 00    	pushq  0x2017d2(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400836:	ff 25 d4 17 20 00    	jmpq   *0x2017d4(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40083c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400840 <free@plt>:
  400840:	ff 25 d2 17 20 00    	jmpq   *0x2017d2(%rip)        # 602018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400846:	68 00 00 00 00       	pushq  $0x0
  40084b:	e9 e0 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400850 <strcpy@plt>:
  400850:	ff 25 ca 17 20 00    	jmpq   *0x2017ca(%rip)        # 602020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400856:	68 01 00 00 00       	pushq  $0x1
  40085b:	e9 d0 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400860 <strlen@plt>:
  400860:	ff 25 c2 17 20 00    	jmpq   *0x2017c2(%rip)        # 602028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400866:	68 02 00 00 00       	pushq  $0x2
  40086b:	e9 c0 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400870 <__stack_chk_fail@plt>:
  400870:	ff 25 ba 17 20 00    	jmpq   *0x2017ba(%rip)        # 602030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400876:	68 03 00 00 00       	pushq  $0x3
  40087b:	e9 b0 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400880 <dup2@plt>:
  400880:	ff 25 b2 17 20 00    	jmpq   *0x2017b2(%rip)        # 602038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400886:	68 04 00 00 00       	pushq  $0x4
  40088b:	e9 a0 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400890 <fgetc@plt>:
  400890:	ff 25 aa 17 20 00    	jmpq   *0x2017aa(%rip)        # 602040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400896:	68 05 00 00 00       	pushq  $0x5
  40089b:	e9 90 ff ff ff       	jmpq   400830 <_init+0x20>

00000000004008a0 <close@plt>:
  4008a0:	ff 25 a2 17 20 00    	jmpq   *0x2017a2(%rip)        # 602048 <_GLOBAL_OFFSET_TABLE_+0x48>
  4008a6:	68 06 00 00 00       	pushq  $0x6
  4008ab:	e9 80 ff ff ff       	jmpq   400830 <_init+0x20>

00000000004008b0 <regcomp@plt>:
  4008b0:	ff 25 9a 17 20 00    	jmpq   *0x20179a(%rip)        # 602050 <_GLOBAL_OFFSET_TABLE_+0x50>
  4008b6:	68 07 00 00 00       	pushq  $0x7
  4008bb:	e9 70 ff ff ff       	jmpq   400830 <_init+0x20>

00000000004008c0 <__libc_start_main@plt>:
  4008c0:	ff 25 92 17 20 00    	jmpq   *0x201792(%rip)        # 602058 <_GLOBAL_OFFSET_TABLE_+0x58>
  4008c6:	68 08 00 00 00       	pushq  $0x8
  4008cb:	e9 60 ff ff ff       	jmpq   400830 <_init+0x20>

00000000004008d0 <malloc@plt>:
  4008d0:	ff 25 8a 17 20 00    	jmpq   *0x20178a(%rip)        # 602060 <_GLOBAL_OFFSET_TABLE_+0x60>
  4008d6:	68 09 00 00 00       	pushq  $0x9
  4008db:	e9 50 ff ff ff       	jmpq   400830 <_init+0x20>

00000000004008e0 <_IO_getc@plt>:
  4008e0:	ff 25 82 17 20 00    	jmpq   *0x201782(%rip)        # 602068 <_GLOBAL_OFFSET_TABLE_+0x68>
  4008e6:	68 0a 00 00 00       	pushq  $0xa
  4008eb:	e9 40 ff ff ff       	jmpq   400830 <_init+0x20>

00000000004008f0 <regexec@plt>:
  4008f0:	ff 25 7a 17 20 00    	jmpq   *0x20177a(%rip)        # 602070 <_GLOBAL_OFFSET_TABLE_+0x70>
  4008f6:	68 0b 00 00 00       	pushq  $0xb
  4008fb:	e9 30 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400900 <__printf_chk@plt>:
  400900:	ff 25 72 17 20 00    	jmpq   *0x201772(%rip)        # 602078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400906:	68 0c 00 00 00       	pushq  $0xc
  40090b:	e9 20 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400910 <waitpid@plt>:
  400910:	ff 25 6a 17 20 00    	jmpq   *0x20176a(%rip)        # 602080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400916:	68 0d 00 00 00       	pushq  $0xd
  40091b:	e9 10 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400920 <open@plt>:
  400920:	ff 25 62 17 20 00    	jmpq   *0x201762(%rip)        # 602088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400926:	68 0e 00 00 00       	pushq  $0xe
  40092b:	e9 00 ff ff ff       	jmpq   400830 <_init+0x20>

0000000000400930 <strtok@plt>:
  400930:	ff 25 5a 17 20 00    	jmpq   *0x20175a(%rip)        # 602090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400936:	68 0f 00 00 00       	pushq  $0xf
  40093b:	e9 f0 fe ff ff       	jmpq   400830 <_init+0x20>

0000000000400940 <execvp@plt>:
  400940:	ff 25 52 17 20 00    	jmpq   *0x201752(%rip)        # 602098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400946:	68 10 00 00 00       	pushq  $0x10
  40094b:	e9 e0 fe ff ff       	jmpq   400830 <_init+0x20>

0000000000400950 <exit@plt>:
  400950:	ff 25 4a 17 20 00    	jmpq   *0x20174a(%rip)        # 6020a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400956:	68 11 00 00 00       	pushq  $0x11
  40095b:	e9 d0 fe ff ff       	jmpq   400830 <_init+0x20>

0000000000400960 <fork@plt>:
  400960:	ff 25 42 17 20 00    	jmpq   *0x201742(%rip)        # 6020a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400966:	68 12 00 00 00       	pushq  $0x12
  40096b:	e9 c0 fe ff ff       	jmpq   400830 <_init+0x20>

Disassembly of section .plt.got:

0000000000400970 <.plt.got>:
  400970:	ff 25 82 16 20 00    	jmpq   *0x201682(%rip)        # 601ff8 <_DYNAMIC+0x1d0>
  400976:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400980 <main>:
  400980:	48 83 ec 08          	sub    $0x8,%rsp
  400984:	be 90 17 40 00       	mov    $0x401790,%esi
  400989:	bf 01 00 00 00       	mov    $0x1,%edi
  40098e:	31 c0                	xor    %eax,%eax
  400990:	e8 6b ff ff ff       	callq  400900 <__printf_chk@plt>
  400995:	31 c0                	xor    %eax,%eax
  400997:	e8 44 0b 00 00       	callq  4014e0 <SppRun>
  40099c:	31 c0                	xor    %eax,%eax
  40099e:	48 83 c4 08          	add    $0x8,%rsp
  4009a2:	c3                   	retq   
  4009a3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4009aa:	00 00 00 
  4009ad:	0f 1f 00             	nopl   (%rax)

00000000004009b0 <_start>:
  4009b0:	31 ed                	xor    %ebp,%ebp
  4009b2:	49 89 d1             	mov    %rdx,%r9
  4009b5:	5e                   	pop    %rsi
  4009b6:	48 89 e2             	mov    %rsp,%rdx
  4009b9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4009bd:	50                   	push   %rax
  4009be:	54                   	push   %rsp
  4009bf:	49 c7 c0 00 16 40 00 	mov    $0x401600,%r8
  4009c6:	48 c7 c1 90 15 40 00 	mov    $0x401590,%rcx
  4009cd:	48 c7 c7 80 09 40 00 	mov    $0x400980,%rdi
  4009d4:	e8 e7 fe ff ff       	callq  4008c0 <__libc_start_main@plt>
  4009d9:	f4                   	hlt    
  4009da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004009e0 <deregister_tm_clones>:
  4009e0:	b8 c7 20 60 00       	mov    $0x6020c7,%eax
  4009e5:	55                   	push   %rbp
  4009e6:	48 2d c0 20 60 00    	sub    $0x6020c0,%rax
  4009ec:	48 83 f8 0e          	cmp    $0xe,%rax
  4009f0:	48 89 e5             	mov    %rsp,%rbp
  4009f3:	76 1b                	jbe    400a10 <deregister_tm_clones+0x30>
  4009f5:	b8 00 00 00 00       	mov    $0x0,%eax
  4009fa:	48 85 c0             	test   %rax,%rax
  4009fd:	74 11                	je     400a10 <deregister_tm_clones+0x30>
  4009ff:	5d                   	pop    %rbp
  400a00:	bf c0 20 60 00       	mov    $0x6020c0,%edi
  400a05:	ff e0                	jmpq   *%rax
  400a07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400a0e:	00 00 
  400a10:	5d                   	pop    %rbp
  400a11:	c3                   	retq   
  400a12:	0f 1f 40 00          	nopl   0x0(%rax)
  400a16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400a1d:	00 00 00 

0000000000400a20 <register_tm_clones>:
  400a20:	be c0 20 60 00       	mov    $0x6020c0,%esi
  400a25:	55                   	push   %rbp
  400a26:	48 81 ee c0 20 60 00 	sub    $0x6020c0,%rsi
  400a2d:	48 c1 fe 03          	sar    $0x3,%rsi
  400a31:	48 89 e5             	mov    %rsp,%rbp
  400a34:	48 89 f0             	mov    %rsi,%rax
  400a37:	48 c1 e8 3f          	shr    $0x3f,%rax
  400a3b:	48 01 c6             	add    %rax,%rsi
  400a3e:	48 d1 fe             	sar    %rsi
  400a41:	74 15                	je     400a58 <register_tm_clones+0x38>
  400a43:	b8 00 00 00 00       	mov    $0x0,%eax
  400a48:	48 85 c0             	test   %rax,%rax
  400a4b:	74 0b                	je     400a58 <register_tm_clones+0x38>
  400a4d:	5d                   	pop    %rbp
  400a4e:	bf c0 20 60 00       	mov    $0x6020c0,%edi
  400a53:	ff e0                	jmpq   *%rax
  400a55:	0f 1f 00             	nopl   (%rax)
  400a58:	5d                   	pop    %rbp
  400a59:	c3                   	retq   
  400a5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400a60 <__do_global_dtors_aux>:
  400a60:	80 3d 61 16 20 00 00 	cmpb   $0x0,0x201661(%rip)        # 6020c8 <completed.7585>
  400a67:	75 11                	jne    400a7a <__do_global_dtors_aux+0x1a>
  400a69:	55                   	push   %rbp
  400a6a:	48 89 e5             	mov    %rsp,%rbp
  400a6d:	e8 6e ff ff ff       	callq  4009e0 <deregister_tm_clones>
  400a72:	5d                   	pop    %rbp
  400a73:	c6 05 4e 16 20 00 01 	movb   $0x1,0x20164e(%rip)        # 6020c8 <completed.7585>
  400a7a:	f3 c3                	repz retq 
  400a7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400a80 <frame_dummy>:
  400a80:	bf 20 1e 60 00       	mov    $0x601e20,%edi
  400a85:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400a89:	75 05                	jne    400a90 <frame_dummy+0x10>
  400a8b:	eb 93                	jmp    400a20 <register_tm_clones>
  400a8d:	0f 1f 00             	nopl   (%rax)
  400a90:	b8 00 00 00 00       	mov    $0x0,%eax
  400a95:	48 85 c0             	test   %rax,%rax
  400a98:	74 f1                	je     400a8b <frame_dummy+0xb>
  400a9a:	55                   	push   %rbp
  400a9b:	48 89 e5             	mov    %rsp,%rbp
  400a9e:	ff d0                	callq  *%rax
  400aa0:	5d                   	pop    %rbp
  400aa1:	e9 7a ff ff ff       	jmpq   400a20 <register_tm_clones>
  400aa6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400aad:	00 00 00 

0000000000400ab0 <CountWords>:
  400ab0:	0f b6 17             	movzbl (%rdi),%edx
  400ab3:	84 d2                	test   %dl,%dl
  400ab5:	89 d6                	mov    %edx,%esi
  400ab7:	0f 95 c1             	setne  %cl
  400aba:	83 e6 fd             	and    $0xfffffffd,%esi
  400abd:	40 80 fe 3c          	cmp    $0x3c,%sil
  400ac1:	0f b6 c1             	movzbl %cl,%eax
  400ac4:	74 4a                	je     400b10 <CountWords+0x60>
  400ac6:	84 c9                	test   %cl,%cl
  400ac8:	74 46                	je     400b10 <CountWords+0x60>
  400aca:	31 f6                	xor    %esi,%esi
  400acc:	eb 1e                	jmp    400aec <CountWords+0x3c>
  400ace:	66 90                	xchg   %ax,%ax
  400ad0:	83 fe 01             	cmp    $0x1,%esi
  400ad3:	74 2b                	je     400b00 <CountWords+0x50>
  400ad5:	31 f6                	xor    %esi,%esi
  400ad7:	48 83 c7 01          	add    $0x1,%rdi
  400adb:	0f b6 17             	movzbl (%rdi),%edx
  400ade:	89 d1                	mov    %edx,%ecx
  400ae0:	83 e1 fd             	and    $0xfffffffd,%ecx
  400ae3:	80 f9 3c             	cmp    $0x3c,%cl
  400ae6:	74 28                	je     400b10 <CountWords+0x60>
  400ae8:	84 d2                	test   %dl,%dl
  400aea:	74 24                	je     400b10 <CountWords+0x60>
  400aec:	80 fa 20             	cmp    $0x20,%dl
  400aef:	75 df                	jne    400ad0 <CountWords+0x20>
  400af1:	be 01 00 00 00       	mov    $0x1,%esi
  400af6:	eb df                	jmp    400ad7 <CountWords+0x27>
  400af8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400aff:	00 
  400b00:	83 c0 01             	add    $0x1,%eax
  400b03:	31 f6                	xor    %esi,%esi
  400b05:	eb d0                	jmp    400ad7 <CountWords+0x27>
  400b07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400b0e:	00 00 
  400b10:	f3 c3                	repz retq 
  400b12:	0f 1f 40 00          	nopl   0x0(%rax)
  400b16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400b1d:	00 00 00 

0000000000400b20 <FreeBuffer>:
  400b20:	83 3e 01             	cmpl   $0x1,(%rsi)
  400b23:	74 37                	je     400b5c <FreeBuffer+0x3c>
  400b25:	55                   	push   %rbp
  400b26:	53                   	push   %rbx
  400b27:	48 89 fd             	mov    %rdi,%rbp
  400b2a:	48 83 ec 08          	sub    $0x8,%rsp
  400b2e:	48 8b 07             	mov    (%rdi),%rax
  400b31:	48 8b 38             	mov    (%rax),%rdi
  400b34:	48 85 ff             	test   %rdi,%rdi
  400b37:	74 1d                	je     400b56 <FreeBuffer+0x36>
  400b39:	bb 08 00 00 00       	mov    $0x8,%ebx
  400b3e:	66 90                	xchg   %ax,%ax
  400b40:	e8 fb fc ff ff       	callq  400840 <free@plt>
  400b45:	48 8b 45 00          	mov    0x0(%rbp),%rax
  400b49:	48 8b 3c 18          	mov    (%rax,%rbx,1),%rdi
  400b4d:	48 83 c3 08          	add    $0x8,%rbx
  400b51:	48 85 ff             	test   %rdi,%rdi
  400b54:	75 ea                	jne    400b40 <FreeBuffer+0x20>
  400b56:	48 83 c4 08          	add    $0x8,%rsp
  400b5a:	5b                   	pop    %rbx
  400b5b:	5d                   	pop    %rbp
  400b5c:	f3 c3                	repz retq 
  400b5e:	66 90                	xchg   %ax,%ax

0000000000400b60 <GrabLine>:
  400b60:	8b 06                	mov    (%rsi),%eax
  400b62:	85 c0                	test   %eax,%eax
  400b64:	75 3c                	jne    400ba2 <GrabLine+0x42>
  400b66:	41 54                	push   %r12
  400b68:	49 89 f4             	mov    %rsi,%r12
  400b6b:	55                   	push   %rbp
  400b6c:	48 8d 6f 51          	lea    0x51(%rdi),%rbp
  400b70:	53                   	push   %rbx
  400b71:	48 89 fb             	mov    %rdi,%rbx
  400b74:	eb 15                	jmp    400b8b <GrabLine+0x2b>
  400b76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400b7d:	00 00 00 
  400b80:	88 03                	mov    %al,(%rbx)
  400b82:	48 83 c3 01          	add    $0x1,%rbx
  400b86:	48 39 eb             	cmp    %rbp,%rbx
  400b89:	74 1d                	je     400ba8 <GrabLine+0x48>
  400b8b:	48 8b 3d 2e 15 20 00 	mov    0x20152e(%rip),%rdi        # 6020c0 <__TMC_END__>
  400b92:	e8 f9 fc ff ff       	callq  400890 <fgetc@plt>
  400b97:	3c 0a                	cmp    $0xa,%al
  400b99:	75 e5                	jne    400b80 <GrabLine+0x20>
  400b9b:	c6 03 00             	movb   $0x0,(%rbx)
  400b9e:	5b                   	pop    %rbx
  400b9f:	5d                   	pop    %rbp
  400ba0:	41 5c                	pop    %r12
  400ba2:	f3 c3                	repz retq 
  400ba4:	0f 1f 40 00          	nopl   0x0(%rax)
  400ba8:	48 b8 4c 69 6e 65 20 	movabs $0x61686320656e694c,%rax
  400baf:	63 68 61 
  400bb2:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
  400bb9:	00 
  400bba:	41 c7 44 24 04 65 00 	movl   $0x65,0x4(%r12)
  400bc1:	00 00 
  400bc3:	49 89 44 24 08       	mov    %rax,0x8(%r12)
  400bc8:	48 b8 72 61 63 74 65 	movabs $0x6c20726574636172,%rax
  400bcf:	72 20 6c 
  400bd2:	49 c7 44 24 28 00 00 	movq   $0x0,0x28(%r12)
  400bd9:	00 00 
  400bdb:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  400be0:	48 b8 69 6d 69 74 20 	movabs $0x6378652074696d69,%rax
  400be7:	65 78 63 
  400bea:	49 c7 44 24 30 00 00 	movq   $0x0,0x30(%r12)
  400bf1:	00 00 
  400bf3:	49 89 44 24 18       	mov    %rax,0x18(%r12)
  400bf8:	48 b8 65 65 64 65 64 	movabs $0x2e6465646565,%rax
  400bff:	2e 00 00 
  400c02:	49 c7 44 24 38 00 00 	movq   $0x0,0x38(%r12)
  400c09:	00 00 
  400c0b:	49 89 44 24 20       	mov    %rax,0x20(%r12)
  400c10:	49 c7 44 24 40 00 00 	movq   $0x0,0x40(%r12)
  400c17:	00 00 
  400c19:	41 c7 44 24 48 00 00 	movl   $0x0,0x48(%r12)
  400c20:	00 00 
  400c22:	41 c7 44 24 4c 00 00 	movl   $0x0,0x4c(%r12)
  400c29:	00 00 
  400c2b:	48 8b 3d 8e 14 20 00 	mov    0x20148e(%rip),%rdi        # 6020c0 <__TMC_END__>
  400c32:	e8 a9 fc ff ff       	callq  4008e0 <_IO_getc@plt>
  400c37:	83 f8 0a             	cmp    $0xa,%eax
  400c3a:	0f 84 5e ff ff ff    	je     400b9e <GrabLine+0x3e>
  400c40:	83 f8 ff             	cmp    $0xffffffff,%eax
  400c43:	75 e6                	jne    400c2b <GrabLine+0xcb>
  400c45:	e9 54 ff ff ff       	jmpq   400b9e <GrabLine+0x3e>
  400c4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400c50 <CheckSyntax>:
  400c50:	8b 02                	mov    (%rdx),%eax
  400c52:	85 c0                	test   %eax,%eax
  400c54:	74 0a                	je     400c60 <CheckSyntax+0x10>
  400c56:	c3                   	retq   
  400c57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400c5e:	00 00 
  400c60:	41 54                	push   %r12
  400c62:	55                   	push   %rbp
  400c63:	31 c9                	xor    %ecx,%ecx
  400c65:	53                   	push   %rbx
  400c66:	45 31 c0             	xor    %r8d,%r8d
  400c69:	48 89 fb             	mov    %rdi,%rbx
  400c6c:	49 89 d4             	mov    %rdx,%r12
  400c6f:	48 89 f5             	mov    %rsi,%rbp
  400c72:	31 d2                	xor    %edx,%edx
  400c74:	48 89 fe             	mov    %rdi,%rsi
  400c77:	bf e0 20 60 00       	mov    $0x6020e0,%edi
  400c7c:	e8 6f fc ff ff       	callq  4008f0 <regexec@plt>
  400c81:	0f b6 0b             	movzbl (%rbx),%ecx
  400c84:	84 c9                	test   %cl,%cl
  400c86:	0f 84 d4 00 00 00    	je     400d60 <CheckSyntax+0x110>
  400c8c:	85 c0                	test   %eax,%eax
  400c8e:	75 48                	jne    400cd8 <CheckSyntax+0x88>
  400c90:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
  400c94:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  400c99:	eb 2b                	jmp    400cc6 <CheckSyntax+0x76>
  400c9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400ca0:	80 f9 3c             	cmp    $0x3c,%cl
  400ca3:	74 12                	je     400cb7 <CheckSyntax+0x67>
  400ca5:	0f be 07             	movsbl (%rdi),%eax
  400ca8:	39 d0                	cmp    %edx,%eax
  400caa:	0f 84 c0 00 00 00    	je     400d70 <CheckSyntax+0x120>
  400cb0:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%rbp)
  400cb7:	0f b6 0f             	movzbl (%rdi),%ecx
  400cba:	48 83 c7 01          	add    $0x1,%rdi
  400cbe:	84 c9                	test   %cl,%cl
  400cc0:	0f 84 8c 00 00 00    	je     400d52 <CheckSyntax+0x102>
  400cc6:	80 f9 3e             	cmp    $0x3e,%cl
  400cc9:	75 d5                	jne    400ca0 <CheckSyntax+0x50>
  400ccb:	ba 3e 00 00 00       	mov    $0x3e,%edx
  400cd0:	eb e5                	jmp    400cb7 <CheckSyntax+0x67>
  400cd2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400cd8:	48 b8 53 79 6e 74 61 	movabs $0x45207861746e7953,%rax
  400cdf:	78 20 45 
  400ce2:	49 8d 7c 24 20       	lea    0x20(%r12),%rdi
  400ce7:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
  400cee:	00 
  400cef:	49 89 44 24 08       	mov    %rax,0x8(%r12)
  400cf4:	48 b8 72 72 6f 72 2e 	movabs $0x2e726f7272,%rax
  400cfb:	00 00 00 
  400cfe:	41 c7 44 24 04 66 00 	movl   $0x66,0x4(%r12)
  400d05:	00 00 
  400d07:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  400d0c:	49 8d 44 24 18       	lea    0x18(%r12),%rax
  400d11:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  400d15:	49 c7 44 24 18 00 00 	movq   $0x0,0x18(%r12)
  400d1c:	00 00 
  400d1e:	49 c7 44 24 40 00 00 	movq   $0x0,0x40(%r12)
  400d25:	00 00 
  400d27:	48 29 f8             	sub    %rdi,%rax
  400d2a:	8d 48 30             	lea    0x30(%rax),%ecx
  400d2d:	89 c8                	mov    %ecx,%eax
  400d2f:	c1 e8 03             	shr    $0x3,%eax
  400d32:	89 c1                	mov    %eax,%ecx
  400d34:	31 c0                	xor    %eax,%eax
  400d36:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  400d39:	41 c7 44 24 48 00 00 	movl   $0x0,0x48(%r12)
  400d40:	00 00 
  400d42:	41 c7 44 24 4c 00 00 	movl   $0x0,0x4c(%r12)
  400d49:	00 00 
  400d4b:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
  400d52:	5b                   	pop    %rbx
  400d53:	5d                   	pop    %rbp
  400d54:	41 5c                	pop    %r12
  400d56:	c3                   	retq   
  400d57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400d5e:	00 00 
  400d60:	c7 45 00 01 00 00 00 	movl   $0x1,0x0(%rbp)
  400d67:	eb e9                	jmp    400d52 <CheckSyntax+0x102>
  400d69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400d70:	48 b8 53 79 6e 74 61 	movabs $0x45207861746e7953,%rax
  400d77:	78 20 45 
  400d7a:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
  400d81:	00 
  400d82:	41 c7 44 24 04 70 00 	movl   $0x70,0x4(%r12)
  400d89:	00 00 
  400d8b:	49 89 44 24 08       	mov    %rax,0x8(%r12)
  400d90:	48 b8 72 72 6f 72 20 	movabs $0x44202d20726f7272,%rax
  400d97:	2d 20 44 
  400d9a:	49 c7 44 24 28 00 00 	movq   $0x0,0x28(%r12)
  400da1:	00 00 
  400da3:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  400da8:	48 b8 6f 75 62 6c 65 	movabs $0x655220656c62756f,%rax
  400daf:	20 52 65 
  400db2:	49 c7 44 24 30 00 00 	movq   $0x0,0x30(%r12)
  400db9:	00 00 
  400dbb:	49 89 44 24 18       	mov    %rax,0x18(%r12)
  400dc0:	48 b8 64 69 72 65 63 	movabs $0x2e746365726964,%rax
  400dc7:	74 2e 00 
  400dca:	49 c7 44 24 38 00 00 	movq   $0x0,0x38(%r12)
  400dd1:	00 00 
  400dd3:	49 89 44 24 20       	mov    %rax,0x20(%r12)
  400dd8:	49 c7 44 24 40 00 00 	movq   $0x0,0x40(%r12)
  400ddf:	00 00 
  400de1:	41 c7 44 24 48 00 00 	movl   $0x0,0x48(%r12)
  400de8:	00 00 
  400dea:	41 c7 44 24 4c 00 00 	movl   $0x0,0x4c(%r12)
  400df1:	00 00 
  400df3:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
  400dfa:	e9 53 ff ff ff       	jmpq   400d52 <CheckSyntax+0x102>
  400dff:	90                   	nop

0000000000400e00 <HandleError>:
  400e00:	83 3f 01             	cmpl   $0x1,(%rdi)
  400e03:	74 0b                	je     400e10 <HandleError+0x10>
  400e05:	f3 c3                	repz retq 
  400e07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e0e:	00 00 
  400e10:	48 8d 57 08          	lea    0x8(%rdi),%rdx
  400e14:	be 14 16 40 00       	mov    $0x401614,%esi
  400e19:	bf 01 00 00 00       	mov    $0x1,%edi
  400e1e:	31 c0                	xor    %eax,%eax
  400e20:	e9 db fa ff ff       	jmpq   400900 <__printf_chk@plt>
  400e25:	90                   	nop
  400e26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e2d:	00 00 00 

0000000000400e30 <RunExtractor>:
  400e30:	83 ff 07             	cmp    $0x7,%edi
  400e33:	0f 87 a3 01 00 00    	ja     400fdc <RunExtractor+0x1ac>
  400e39:	41 55                	push   %r13
  400e3b:	41 54                	push   %r12
  400e3d:	89 ff                	mov    %edi,%edi
  400e3f:	55                   	push   %rbp
  400e40:	53                   	push   %rbx
  400e41:	48 89 f5             	mov    %rsi,%rbp
  400e44:	48 89 d3             	mov    %rdx,%rbx
  400e47:	48 83 ec 08          	sub    $0x8,%rsp
  400e4b:	ff 24 fd 30 16 40 00 	jmpq   *0x401630(,%rdi,8)
  400e52:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400e58:	4c 63 62 18          	movslq 0x18(%rdx),%r12
  400e5c:	48 8b 42 10          	mov    0x10(%rdx),%rax
  400e60:	48 8b 3e             	mov    (%rsi),%rdi
  400e63:	4e 8d 2c e0          	lea    (%rax,%r12,8),%r13
  400e67:	e8 f4 f9 ff ff       	callq  400860 <strlen@plt>
  400e6c:	48 8d 78 01          	lea    0x1(%rax),%rdi
  400e70:	e8 5b fa ff ff       	callq  4008d0 <malloc@plt>
  400e75:	49 89 45 00          	mov    %rax,0x0(%r13)
  400e79:	48 8b 43 10          	mov    0x10(%rbx),%rax
  400e7d:	48 8b 75 00          	mov    0x0(%rbp),%rsi
  400e81:	4a 8b 3c e0          	mov    (%rax,%r12,8),%rdi
  400e85:	e8 c6 f9 ff ff       	callq  400850 <strcpy@plt>
  400e8a:	83 43 18 01          	addl   $0x1,0x18(%rbx)
  400e8e:	b8 01 00 00 00       	mov    $0x1,%eax
  400e93:	48 83 c4 08          	add    $0x8,%rsp
  400e97:	5b                   	pop    %rbx
  400e98:	5d                   	pop    %rbp
  400e99:	41 5c                	pop    %r12
  400e9b:	41 5d                	pop    %r13
  400e9d:	c3                   	retq   
  400e9e:	66 90                	xchg   %ax,%ax
  400ea0:	48 63 52 18          	movslq 0x18(%rdx),%rdx
  400ea4:	48 8b 43 10          	mov    0x10(%rbx),%rax
  400ea8:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  400eaf:	00 
  400eb0:	48 83 c4 08          	add    $0x8,%rsp
  400eb4:	b8 08 00 00 00       	mov    $0x8,%eax
  400eb9:	5b                   	pop    %rbx
  400eba:	5d                   	pop    %rbp
  400ebb:	41 5c                	pop    %r12
  400ebd:	41 5d                	pop    %r13
  400ebf:	c3                   	retq   
  400ec0:	bf 41 00 00 00       	mov    $0x41,%edi
  400ec5:	e8 06 fa ff ff       	callq  4008d0 <malloc@plt>
  400eca:	48 8b 3b             	mov    (%rbx),%rdi
  400ecd:	48 89 43 10          	mov    %rax,0x10(%rbx)
  400ed1:	be 23 16 40 00       	mov    $0x401623,%esi
  400ed6:	e8 55 fa ff ff       	callq  400930 <strtok@plt>
  400edb:	48 89 45 00          	mov    %rax,0x0(%rbp)
  400edf:	48 83 c4 08          	add    $0x8,%rsp
  400ee3:	b8 06 00 00 00       	mov    $0x6,%eax
  400ee8:	5b                   	pop    %rbx
  400ee9:	5d                   	pop    %rbp
  400eea:	41 5c                	pop    %r12
  400eec:	41 5d                	pop    %r13
  400eee:	c3                   	retq   
  400eef:	90                   	nop
  400ef0:	31 ff                	xor    %edi,%edi
  400ef2:	be 23 16 40 00       	mov    $0x401623,%esi
  400ef7:	e8 34 fa ff ff       	callq  400930 <strtok@plt>
  400efc:	48 89 c2             	mov    %rax,%rdx
  400eff:	48 89 45 00          	mov    %rax,0x0(%rbp)
  400f03:	b8 07 00 00 00       	mov    $0x7,%eax
  400f08:	48 85 d2             	test   %rdx,%rdx
  400f0b:	74 86                	je     400e93 <RunExtractor+0x63>
  400f0d:	0f b6 12             	movzbl (%rdx),%edx
  400f10:	84 d2                	test   %dl,%dl
  400f12:	0f 84 7b ff ff ff    	je     400e93 <RunExtractor+0x63>
  400f18:	80 fa 3c             	cmp    $0x3c,%dl
  400f1b:	b8 03 00 00 00       	mov    $0x3,%eax
  400f20:	0f 84 6d ff ff ff    	je     400e93 <RunExtractor+0x63>
  400f26:	31 c0                	xor    %eax,%eax
  400f28:	80 fa 3e             	cmp    $0x3e,%dl
  400f2b:	0f 95 c0             	setne  %al
  400f2e:	8d 04 85 02 00 00 00 	lea    0x2(,%rax,4),%eax
  400f35:	e9 59 ff ff ff       	jmpq   400e93 <RunExtractor+0x63>
  400f3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400f40:	c7 42 1c 01 00 00 00 	movl   $0x1,0x1c(%rdx)
  400f47:	48 83 c4 08          	add    $0x8,%rsp
  400f4b:	b8 04 00 00 00       	mov    $0x4,%eax
  400f50:	5b                   	pop    %rbx
  400f51:	5d                   	pop    %rbp
  400f52:	41 5c                	pop    %r12
  400f54:	41 5d                	pop    %r13
  400f56:	c3                   	retq   
  400f57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400f5e:	00 00 
  400f60:	c7 42 20 01 00 00 00 	movl   $0x1,0x20(%rdx)
  400f67:	48 83 c4 08          	add    $0x8,%rsp
  400f6b:	b8 05 00 00 00       	mov    $0x5,%eax
  400f70:	5b                   	pop    %rbx
  400f71:	5d                   	pop    %rbp
  400f72:	41 5c                	pop    %r12
  400f74:	41 5d                	pop    %r13
  400f76:	c3                   	retq   
  400f77:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400f7e:	00 00 
  400f80:	be 23 16 40 00       	mov    $0x401623,%esi
  400f85:	31 ff                	xor    %edi,%edi
  400f87:	e8 a4 f9 ff ff       	callq  400930 <strtok@plt>
  400f8c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  400f90:	48 8b 7b 28          	mov    0x28(%rbx),%rdi
  400f94:	48 89 c6             	mov    %rax,%rsi
  400f97:	e8 b4 f8 ff ff       	callq  400850 <strcpy@plt>
  400f9c:	48 83 c4 08          	add    $0x8,%rsp
  400fa0:	b8 01 00 00 00       	mov    $0x1,%eax
  400fa5:	5b                   	pop    %rbx
  400fa6:	5d                   	pop    %rbp
  400fa7:	41 5c                	pop    %r12
  400fa9:	41 5d                	pop    %r13
  400fab:	c3                   	retq   
  400fac:	0f 1f 40 00          	nopl   0x0(%rax)
  400fb0:	be 23 16 40 00       	mov    $0x401623,%esi
  400fb5:	31 ff                	xor    %edi,%edi
  400fb7:	e8 74 f9 ff ff       	callq  400930 <strtok@plt>
  400fbc:	48 89 45 00          	mov    %rax,0x0(%rbp)
  400fc0:	48 8b 7b 30          	mov    0x30(%rbx),%rdi
  400fc4:	48 89 c6             	mov    %rax,%rsi
  400fc7:	e8 84 f8 ff ff       	callq  400850 <strcpy@plt>
  400fcc:	48 83 c4 08          	add    $0x8,%rsp
  400fd0:	b8 01 00 00 00       	mov    $0x1,%eax
  400fd5:	5b                   	pop    %rbx
  400fd6:	5d                   	pop    %rbp
  400fd7:	41 5c                	pop    %r12
  400fd9:	41 5d                	pop    %r13
  400fdb:	c3                   	retq   
  400fdc:	b8 08 00 00 00       	mov    $0x8,%eax
  400fe1:	c3                   	retq   
  400fe2:	0f 1f 40 00          	nopl   0x0(%rax)
  400fe6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400fed:	00 00 00 

0000000000400ff0 <ExtractCmds>:
  400ff0:	55                   	push   %rbp
  400ff1:	53                   	push   %rbx
  400ff2:	48 89 f5             	mov    %rsi,%rbp
  400ff5:	48 89 fb             	mov    %rdi,%rbx
  400ff8:	48 83 ec 18          	sub    $0x18,%rsp
  400ffc:	c7 47 18 00 00 00 00 	movl   $0x0,0x18(%rdi)
  401003:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40100a:	00 00 
  40100c:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401011:	31 c0                	xor    %eax,%eax
  401013:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401018:	48 89 e9             	mov    %rbp,%rcx
  40101b:	48 89 da             	mov    %rbx,%rdx
  40101e:	48 89 e6             	mov    %rsp,%rsi
  401021:	89 c7                	mov    %eax,%edi
  401023:	e8 08 fe ff ff       	callq  400e30 <RunExtractor>
  401028:	83 f8 08             	cmp    $0x8,%eax
  40102b:	75 eb                	jne    401018 <ExtractCmds+0x28>
  40102d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401032:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401039:	00 00 
  40103b:	75 07                	jne    401044 <ExtractCmds+0x54>
  40103d:	48 83 c4 18          	add    $0x18,%rsp
  401041:	5b                   	pop    %rbx
  401042:	5d                   	pop    %rbp
  401043:	c3                   	retq   
  401044:	e8 27 f8 ff ff       	callq  400870 <__stack_chk_fail@plt>
  401049:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401050 <SppIterate>:
  401050:	41 55                	push   %r13
  401052:	41 54                	push   %r12
  401054:	55                   	push   %rbp
  401055:	53                   	push   %rbx
  401056:	48 83 ec 18          	sub    $0x18,%rsp
  40105a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401061:	00 00 
  401063:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401068:	31 c0                	xor    %eax,%eax
  40106a:	8b 02                	mov    (%rdx),%eax
  40106c:	83 f8 01             	cmp    $0x1,%eax
  40106f:	19 db                	sbb    %ebx,%ebx
  401071:	83 e3 02             	and    $0x2,%ebx
  401074:	83 c3 05             	add    $0x5,%ebx
  401077:	83 ff 07             	cmp    $0x7,%edi
  40107a:	0f 87 c0 00 00 00    	ja     401140 <SppIterate+0xf0>
  401080:	89 ff                	mov    %edi,%edi
  401082:	48 89 f5             	mov    %rsi,%rbp
  401085:	49 89 d4             	mov    %rdx,%r12
  401088:	ff 24 fd f0 16 40 00 	jmpq   *0x4016f0(,%rdi,8)
  40108f:	90                   	nop
  401090:	bf 51 00 00 00       	mov    $0x51,%edi
  401095:	bb 01 00 00 00       	mov    $0x1,%ebx
  40109a:	e8 31 f8 ff ff       	callq  4008d0 <malloc@plt>
  40109f:	ba 09 00 00 00       	mov    $0x9,%edx
  4010a4:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4010a8:	c6 40 50 00          	movb   $0x0,0x50(%rax)
  4010ac:	be 30 17 40 00       	mov    $0x401730,%esi
  4010b1:	bf e0 20 60 00       	mov    $0x6020e0,%edi
  4010b6:	e8 f5 f7 ff ff       	callq  4008b0 <regcomp@plt>
  4010bb:	85 c0                	test   %eax,%eax
  4010bd:	0f 84 7d 00 00 00    	je     401140 <SppIterate+0xf0>
  4010c3:	48 b8 52 65 67 65 78 	movabs $0x6166207865676552,%rax
  4010ca:	20 66 61 
  4010cd:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
  4010d4:	00 
  4010d5:	41 c7 44 24 04 2d 01 	movl   $0x12d,0x4(%r12)
  4010dc:	00 00 
  4010de:	49 89 44 24 08       	mov    %rax,0x8(%r12)
  4010e3:	48 b8 69 6c 65 64 20 	movabs $0x206f742064656c69,%rax
  4010ea:	74 6f 20 
  4010ed:	49 c7 44 24 20 00 00 	movq   $0x0,0x20(%r12)
  4010f4:	00 00 
  4010f6:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  4010fb:	48 b8 63 6f 6d 70 69 	movabs $0x2e656c69706d6f63,%rax
  401102:	6c 65 2e 
  401105:	49 c7 44 24 28 00 00 	movq   $0x0,0x28(%r12)
  40110c:	00 00 
  40110e:	49 89 44 24 18       	mov    %rax,0x18(%r12)
  401113:	49 c7 44 24 30 00 00 	movq   $0x0,0x30(%r12)
  40111a:	00 00 
  40111c:	49 c7 44 24 38 00 00 	movq   $0x0,0x38(%r12)
  401123:	00 00 
  401125:	49 c7 44 24 40 00 00 	movq   $0x0,0x40(%r12)
  40112c:	00 00 
  40112e:	41 c7 44 24 48 00 00 	movl   $0x0,0x48(%r12)
  401135:	00 00 
  401137:	41 c7 44 24 4c 01 00 	movl   $0x1,0x4c(%r12)
  40113e:	00 00 
  401140:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401145:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40114c:	00 00 
  40114e:	89 d8                	mov    %ebx,%eax
  401150:	0f 85 9c 02 00 00    	jne    4013f2 <SppIterate+0x3a2>
  401156:	48 83 c4 18          	add    $0x18,%rsp
  40115a:	5b                   	pop    %rbx
  40115b:	5d                   	pop    %rbp
  40115c:	41 5c                	pop    %r12
  40115e:	41 5d                	pop    %r13
  401160:	c3                   	retq   
  401161:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401168:	8b 46 08             	mov    0x8(%rsi),%eax
  40116b:	45 31 e4             	xor    %r12d,%r12d
  40116e:	31 db                	xor    %ebx,%ebx
  401170:	85 c0                	test   %eax,%eax
  401172:	7e 1d                	jle    401191 <SppIterate+0x141>
  401174:	0f 1f 40 00          	nopl   0x0(%rax)
  401178:	48 8b 45 10          	mov    0x10(%rbp),%rax
  40117c:	83 c3 01             	add    $0x1,%ebx
  40117f:	4a 8b 3c 20          	mov    (%rax,%r12,1),%rdi
  401183:	49 83 c4 08          	add    $0x8,%r12
  401187:	e8 b4 f6 ff ff       	callq  400840 <free@plt>
  40118c:	39 5d 08             	cmp    %ebx,0x8(%rbp)
  40118f:	7f e7                	jg     401178 <SppIterate+0x128>
  401191:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
  401195:	bb 01 00 00 00       	mov    $0x1,%ebx
  40119a:	e8 a1 f6 ff ff       	callq  400840 <free@plt>
  40119f:	48 8b 7d 28          	mov    0x28(%rbp),%rdi
  4011a3:	e8 98 f6 ff ff       	callq  400840 <free@plt>
  4011a8:	48 8b 7d 30          	mov    0x30(%rbp),%rdi
  4011ac:	e8 8f f6 ff ff       	callq  400840 <free@plt>
  4011b1:	c7 45 1c 00 00 00 00 	movl   $0x0,0x1c(%rbp)
  4011b8:	c7 45 20 00 00 00 00 	movl   $0x0,0x20(%rbp)
  4011bf:	e9 7c ff ff ff       	jmpq   401140 <SppIterate+0xf0>
  4011c4:	0f 1f 40 00          	nopl   0x0(%rax)
  4011c8:	48 8b 3e             	mov    (%rsi),%rdi
  4011cb:	e8 70 f6 ff ff       	callq  400840 <free@plt>
  4011d0:	e9 6b ff ff ff       	jmpq   401140 <SppIterate+0xf0>
  4011d5:	0f 1f 00             	nopl   (%rax)
  4011d8:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
  4011dc:	48 89 e6             	mov    %rsp,%rsi
  4011df:	c7 04 24 00 00 00 00 	movl   $0x0,(%rsp)
  4011e6:	bb 03 00 00 00       	mov    $0x3,%ebx
  4011eb:	e8 60 fa ff ff       	callq  400c50 <CheckSyntax>
  4011f0:	8b 04 24             	mov    (%rsp),%eax
  4011f3:	85 c0                	test   %eax,%eax
  4011f5:	0f 84 45 ff ff ff    	je     401140 <SppIterate+0xf0>
  4011fb:	31 db                	xor    %ebx,%ebx
  4011fd:	83 f8 01             	cmp    $0x1,%eax
  401200:	0f 95 c3             	setne  %bl
  401203:	8d 1c 9d 01 00 00 00 	lea    0x1(,%rbx,4),%ebx
  40120a:	e9 31 ff ff ff       	jmpq   401140 <SppIterate+0xf0>
  40120f:	90                   	nop
  401210:	48 8b 36             	mov    (%rsi),%rsi
  401213:	bf 28 16 40 00       	mov    $0x401628,%edi
  401218:	b9 05 00 00 00       	mov    $0x5,%ecx
  40121d:	bb 07 00 00 00       	mov    $0x7,%ebx
  401222:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  401224:	0f 97 c2             	seta   %dl
  401227:	0f 92 c0             	setb   %al
  40122a:	38 c2                	cmp    %al,%dl
  40122c:	0f 84 0e ff ff ff    	je     401140 <SppIterate+0xf0>
  401232:	bf 51 00 00 00       	mov    $0x51,%edi
  401237:	e8 94 f6 ff ff       	callq  4008d0 <malloc@plt>
  40123c:	bf 51 00 00 00       	mov    $0x51,%edi
  401241:	48 89 45 30          	mov    %rax,0x30(%rbp)
  401245:	e8 86 f6 ff ff       	callq  4008d0 <malloc@plt>
  40124a:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%rbp)
  401251:	48 89 45 28          	mov    %rax,0x28(%rbp)
  401255:	31 c0                	xor    %eax,%eax
  401257:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40125e:	00 00 
  401260:	4c 89 e1             	mov    %r12,%rcx
  401263:	48 89 ea             	mov    %rbp,%rdx
  401266:	48 89 e6             	mov    %rsp,%rsi
  401269:	89 c7                	mov    %eax,%edi
  40126b:	e8 c0 fb ff ff       	callq  400e30 <RunExtractor>
  401270:	83 f8 08             	cmp    $0x8,%eax
  401273:	75 eb                	jne    401260 <SppIterate+0x210>
  401275:	bb 04 00 00 00       	mov    $0x4,%ebx
  40127a:	e9 c1 fe ff ff       	jmpq   401140 <SppIterate+0xf0>
  40127f:	90                   	nop
  401280:	e8 db f6 ff ff       	callq  400960 <fork@plt>
  401285:	85 c0                	test   %eax,%eax
  401287:	0f 85 23 01 00 00    	jne    4013b0 <SppIterate+0x360>
  40128d:	83 7d 1c 00          	cmpl   $0x0,0x1c(%rbp)
  401291:	49 8d 5c 24 08       	lea    0x8(%r12),%rbx
  401296:	0f 85 5b 01 00 00    	jne    4013f7 <SppIterate+0x3a7>
  40129c:	83 7d 20 00          	cmpl   $0x0,0x20(%rbp)
  4012a0:	0f 85 c7 01 00 00    	jne    40146d <SppIterate+0x41d>
  4012a6:	48 8b 45 10          	mov    0x10(%rbp),%rax
  4012aa:	48 8b 38             	mov    (%rax),%rdi
  4012ad:	48 89 c6             	mov    %rax,%rsi
  4012b0:	e8 8b f6 ff ff       	callq  400940 <execvp@plt>
  4012b5:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
  4012bc:	00 
  4012bd:	41 c7 44 24 04 ca 00 	movl   $0xca,0x4(%r12)
  4012c4:	00 00 
  4012c6:	be 70 16 40 00       	mov    $0x401670,%esi
  4012cb:	b9 23 00 00 00       	mov    $0x23,%ecx
  4012d0:	48 89 df             	mov    %rbx,%rdi
  4012d3:	31 c0                	xor    %eax,%eax
  4012d5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  4012d7:	49 8d 7c 24 2b       	lea    0x2b(%r12),%rdi
  4012dc:	b9 1d 00 00 00       	mov    $0x1d,%ecx
  4012e1:	f3 aa                	rep stos %al,%es:(%rdi)
  4012e3:	41 c7 44 24 48 00 00 	movl   $0x0,0x48(%r12)
  4012ea:	00 00 
  4012ec:	41 c7 44 24 4c 00 00 	movl   $0x0,0x4c(%r12)
  4012f3:	00 00 
  4012f5:	bf 01 00 00 00       	mov    $0x1,%edi
  4012fa:	e8 51 f6 ff ff       	callq  400950 <exit@plt>
  4012ff:	90                   	nop
  401300:	83 f8 01             	cmp    $0x1,%eax
  401303:	0f 84 cf 00 00 00    	je     4013d8 <SppIterate+0x388>
  401309:	41 83 7c 24 4c 01    	cmpl   $0x1,0x4c(%r12)
  40130f:	49 8d 7c 24 18       	lea    0x18(%r12),%rdi
  401314:	49 8d 4c 24 10       	lea    0x10(%r12),%rcx
  401319:	41 c7 04 24 00 00 00 	movl   $0x0,(%r12)
  401320:	00 
  401321:	41 c7 44 24 04 00 00 	movl   $0x0,0x4(%r12)
  401328:	00 00 
  40132a:	49 c7 44 24 08 4f 4b 	movq   $0x4b4f,0x8(%r12)
  401331:	00 00 
  401333:	49 c7 44 24 10 00 00 	movq   $0x0,0x10(%r12)
  40133a:	00 00 
  40133c:	49 c7 44 24 40 00 00 	movq   $0x0,0x40(%r12)
  401343:	00 00 
  401345:	19 db                	sbb    %ebx,%ebx
  401347:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  40134b:	31 c0                	xor    %eax,%eax
  40134d:	48 29 f9             	sub    %rdi,%rcx
  401350:	83 e3 fa             	and    $0xfffffffa,%ebx
  401353:	83 c1 38             	add    $0x38,%ecx
  401356:	83 c3 07             	add    $0x7,%ebx
  401359:	c1 e9 03             	shr    $0x3,%ecx
  40135c:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  40135f:	41 c7 44 24 48 00 00 	movl   $0x0,0x48(%r12)
  401366:	00 00 
  401368:	41 c7 44 24 4c 00 00 	movl   $0x0,0x4c(%r12)
  40136f:	00 00 
  401371:	e9 ca fd ff ff       	jmpq   401140 <SppIterate+0xf0>
  401376:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40137d:	00 00 00 
  401380:	ba 1f 16 40 00       	mov    $0x40161f,%edx
  401385:	be 25 16 40 00       	mov    $0x401625,%esi
  40138a:	bf 01 00 00 00       	mov    $0x1,%edi
  40138f:	31 c0                	xor    %eax,%eax
  401391:	bb 02 00 00 00       	mov    $0x2,%ebx
  401396:	e8 65 f5 ff ff       	callq  400900 <__printf_chk@plt>
  40139b:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
  40139f:	4c 89 e6             	mov    %r12,%rsi
  4013a2:	e8 b9 f7 ff ff       	callq  400b60 <GrabLine>
  4013a7:	e9 94 fd ff ff       	jmpq   401140 <SppIterate+0xf0>
  4013ac:	0f 1f 40 00          	nopl   0x0(%rax)
  4013b0:	31 d2                	xor    %edx,%edx
  4013b2:	48 89 e6             	mov    %rsp,%rsi
  4013b5:	89 c7                	mov    %eax,%edi
  4013b7:	e8 54 f5 ff ff       	callq  400910 <waitpid@plt>
  4013bc:	bb 06 00 00 00       	mov    $0x6,%ebx
  4013c1:	c7 45 20 00 00 00 00 	movl   $0x0,0x20(%rbp)
  4013c8:	c7 45 1c 00 00 00 00 	movl   $0x0,0x1c(%rbp)
  4013cf:	e9 6c fd ff ff       	jmpq   401140 <SppIterate+0xf0>
  4013d4:	0f 1f 40 00          	nopl   0x0(%rax)
  4013d8:	48 8d 52 08          	lea    0x8(%rdx),%rdx
  4013dc:	be 14 16 40 00       	mov    $0x401614,%esi
  4013e1:	bf 01 00 00 00       	mov    $0x1,%edi
  4013e6:	31 c0                	xor    %eax,%eax
  4013e8:	e8 13 f5 ff ff       	callq  400900 <__printf_chk@plt>
  4013ed:	e9 17 ff ff ff       	jmpq   401309 <SppIterate+0x2b9>
  4013f2:	e8 79 f4 ff ff       	callq  400870 <__stack_chk_fail@plt>
  4013f7:	48 8b 7d 28          	mov    0x28(%rbp),%rdi
  4013fb:	31 c0                	xor    %eax,%eax
  4013fd:	ba b0 01 00 00       	mov    $0x1b0,%edx
  401402:	be 41 00 00 00       	mov    $0x41,%esi
  401407:	e8 14 f5 ff ff       	callq  400920 <open@plt>
  40140c:	85 c0                	test   %eax,%eax
  40140e:	41 89 c5             	mov    %eax,%r13d
  401411:	79 40                	jns    401453 <SppIterate+0x403>
  401413:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
  40141a:	00 
  40141b:	41 c7 44 24 04 91 01 	movl   $0x191,0x4(%r12)
  401422:	00 00 
  401424:	be b0 16 40 00       	mov    $0x4016b0,%esi
  401429:	b9 1b 00 00 00       	mov    $0x1b,%ecx
  40142e:	48 89 df             	mov    %rbx,%rdi
  401431:	31 c0                	xor    %eax,%eax
  401433:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401435:	49 8d 7c 24 23       	lea    0x23(%r12),%rdi
  40143a:	b9 25 00 00 00       	mov    $0x25,%ecx
  40143f:	f3 aa                	rep stos %al,%es:(%rdi)
  401441:	41 c7 44 24 48 00 00 	movl   $0x0,0x48(%r12)
  401448:	00 00 
  40144a:	41 c7 44 24 4c 00 00 	movl   $0x0,0x4c(%r12)
  401451:	00 00 
  401453:	44 89 ef             	mov    %r13d,%edi
  401456:	be 01 00 00 00       	mov    $0x1,%esi
  40145b:	e8 20 f4 ff ff       	callq  400880 <dup2@plt>
  401460:	44 89 ef             	mov    %r13d,%edi
  401463:	e8 38 f4 ff ff       	callq  4008a0 <close@plt>
  401468:	e9 2f fe ff ff       	jmpq   40129c <SppIterate+0x24c>
  40146d:	48 8b 7d 30          	mov    0x30(%rbp),%rdi
  401471:	31 f6                	xor    %esi,%esi
  401473:	31 c0                	xor    %eax,%eax
  401475:	e8 a6 f4 ff ff       	callq  400920 <open@plt>
  40147a:	85 c0                	test   %eax,%eax
  40147c:	41 89 c5             	mov    %eax,%r13d
  40147f:	79 40                	jns    4014c1 <SppIterate+0x471>
  401481:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
  401488:	00 
  401489:	41 c7 44 24 04 91 01 	movl   $0x191,0x4(%r12)
  401490:	00 00 
  401492:	be b0 16 40 00       	mov    $0x4016b0,%esi
  401497:	b9 1b 00 00 00       	mov    $0x1b,%ecx
  40149c:	48 89 df             	mov    %rbx,%rdi
  40149f:	31 c0                	xor    %eax,%eax
  4014a1:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  4014a3:	49 8d 7c 24 23       	lea    0x23(%r12),%rdi
  4014a8:	b9 25 00 00 00       	mov    $0x25,%ecx
  4014ad:	f3 aa                	rep stos %al,%es:(%rdi)
  4014af:	41 c7 44 24 48 00 00 	movl   $0x0,0x48(%r12)
  4014b6:	00 00 
  4014b8:	41 c7 44 24 4c 00 00 	movl   $0x0,0x4c(%r12)
  4014bf:	00 00 
  4014c1:	44 89 ef             	mov    %r13d,%edi
  4014c4:	31 f6                	xor    %esi,%esi
  4014c6:	e8 b5 f3 ff ff       	callq  400880 <dup2@plt>
  4014cb:	44 89 ef             	mov    %r13d,%edi
  4014ce:	e8 cd f3 ff ff       	callq  4008a0 <close@plt>
  4014d3:	e9 ce fd ff ff       	jmpq   4012a6 <SppIterate+0x256>
  4014d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4014df:	00 

00000000004014e0 <SppRun>:
  4014e0:	53                   	push   %rbx
  4014e1:	b9 07 00 00 00       	mov    $0x7,%ecx
  4014e6:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
  4014ed:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4014f4:	00 00 
  4014f6:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  4014fd:	00 
  4014fe:	31 c0                	xor    %eax,%eax
  401500:	48 89 e7             	mov    %rsp,%rdi
  401503:	48 89 e3             	mov    %rsp,%rbx
  401506:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%rsp)
  40150d:	00 
  40150e:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401511:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  401516:	b9 07 00 00 00       	mov    $0x7,%ecx
  40151b:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%rsp)
  401522:	00 
  401523:	48 c7 44 24 48 4f 4b 	movq   $0x4b4f,0x48(%rsp)
  40152a:	00 00 
  40152c:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%rsp)
  401533:	00 00 00 00 
  401537:	c7 84 24 8c 00 00 00 	movl   $0x0,0x8c(%rsp)
  40153e:	00 00 00 00 
  401542:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401545:	0f 1f 00             	nopl   (%rax)
  401548:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
  40154d:	48 89 de             	mov    %rbx,%rsi
  401550:	89 c7                	mov    %eax,%edi
  401552:	e8 f9 fa ff ff       	callq  401050 <SppIterate>
  401557:	83 f8 07             	cmp    $0x7,%eax
  40155a:	75 ec                	jne    401548 <SppRun+0x68>
  40155c:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
  401561:	48 89 de             	mov    %rbx,%rsi
  401564:	bf 07 00 00 00       	mov    $0x7,%edi
  401569:	e8 e2 fa ff ff       	callq  401050 <SppIterate>
  40156e:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  401575:	00 
  401576:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40157d:	00 00 
  40157f:	75 09                	jne    40158a <SppRun+0xaa>
  401581:	48 81 c4 a0 00 00 00 	add    $0xa0,%rsp
  401588:	5b                   	pop    %rbx
  401589:	c3                   	retq   
  40158a:	e8 e1 f2 ff ff       	callq  400870 <__stack_chk_fail@plt>
  40158f:	90                   	nop

0000000000401590 <__libc_csu_init>:
  401590:	41 57                	push   %r15
  401592:	41 56                	push   %r14
  401594:	41 89 ff             	mov    %edi,%r15d
  401597:	41 55                	push   %r13
  401599:	41 54                	push   %r12
  40159b:	4c 8d 25 6e 08 20 00 	lea    0x20086e(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  4015a2:	55                   	push   %rbp
  4015a3:	48 8d 2d 6e 08 20 00 	lea    0x20086e(%rip),%rbp        # 601e18 <__init_array_end>
  4015aa:	53                   	push   %rbx
  4015ab:	49 89 f6             	mov    %rsi,%r14
  4015ae:	49 89 d5             	mov    %rdx,%r13
  4015b1:	4c 29 e5             	sub    %r12,%rbp
  4015b4:	48 83 ec 08          	sub    $0x8,%rsp
  4015b8:	48 c1 fd 03          	sar    $0x3,%rbp
  4015bc:	e8 4f f2 ff ff       	callq  400810 <_init>
  4015c1:	48 85 ed             	test   %rbp,%rbp
  4015c4:	74 20                	je     4015e6 <__libc_csu_init+0x56>
  4015c6:	31 db                	xor    %ebx,%ebx
  4015c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4015cf:	00 
  4015d0:	4c 89 ea             	mov    %r13,%rdx
  4015d3:	4c 89 f6             	mov    %r14,%rsi
  4015d6:	44 89 ff             	mov    %r15d,%edi
  4015d9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4015dd:	48 83 c3 01          	add    $0x1,%rbx
  4015e1:	48 39 eb             	cmp    %rbp,%rbx
  4015e4:	75 ea                	jne    4015d0 <__libc_csu_init+0x40>
  4015e6:	48 83 c4 08          	add    $0x8,%rsp
  4015ea:	5b                   	pop    %rbx
  4015eb:	5d                   	pop    %rbp
  4015ec:	41 5c                	pop    %r12
  4015ee:	41 5d                	pop    %r13
  4015f0:	41 5e                	pop    %r14
  4015f2:	41 5f                	pop    %r15
  4015f4:	c3                   	retq   
  4015f5:	90                   	nop
  4015f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4015fd:	00 00 00 

0000000000401600 <__libc_csu_fini>:
  401600:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401604 <_fini>:
  401604:	48 83 ec 08          	sub    $0x8,%rsp
  401608:	48 83 c4 08          	add    $0x8,%rsp
  40160c:	c3                   	retq   
