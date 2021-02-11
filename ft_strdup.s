# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 10:46:09 by user42            #+#    #+#              #
#    Updated: 2021/02/10 10:46:09 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc

ft_strdup:
	cmp		rdi, 0
	jz		error
	call	ft_strlen ; len of rdi in rax
	add		rax, 1 ; + 1 for \0
	push    rdi, ; value of rdi is push on top, what was in  rdi is now in rsi
	mov     rdi, rax ; rdi has now len + 1
	call    malloc wrt ..plt ; return in rax malloc takes rdi vallue
	pop		r9; get arg0 (of ft_strdup) stocked on stack
	cmp		rax, 0; if malloc is null, error
	jz		error	
	mov 	rdi, rax ;set string malloced in rdi
	mov		rsi, r9
	call	ft_strcpy ; call ft_strcpy(rdi, rsi)
	jmp		return

error:
	mov		rax, 0

return:
	ret