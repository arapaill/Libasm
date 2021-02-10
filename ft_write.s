# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 10:46:09 by user42            #+#    #+#              #
#    Updated: 2021/02/10 10:46:09 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
section	.text
	global	ft_write

;fd = rdi, buffer = rsi, bytes = rdx
ft_write:
	mov		r8, rdx ; save len in r8
	mov rax, 0x2000004 ; set call to write
	syscall	;call rax
	jc exit_error
	jmp exit

exit_error:
	mov rax, -1
	ret

exit:
	mov rax, r8
	ret