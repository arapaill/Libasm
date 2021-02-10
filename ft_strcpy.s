# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 10:46:09 by user42            #+#    #+#              #
#    Updated: 2021/02/10 10:46:09 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; ft_strcpy(arg0 = rdi = dst, arg1 = rsi = src)
segment .text
	global _ft_strcpy
	extern _ft_strlen

_ft_strcpy:
	push    rdi ; save rdi at the top of stack
	mov     rdi, rsi ; deplace dans la stack
	call    _ft_strlen ; appel la fct ft_strlen, elle va utiliser rdi (1 stack) resultat dans rax
	mov     rcx, rax ; move rax in rcx because rcx count loop and is use in rep after
	pop     rdi ;remove rdi from top of stack
	cld     ; clear flag DF (security) DF = 0 = increment for rep, DF = 1 = decrement for rep
	mov     rax, rdi ; set return as first adress of rdi
	rep     movsb ; get string from second stack (rsi) and put it until 0; set rdi as rep
	mov		BYTE[rdi], 0; rdi is at the end of the string because of movsb
	jmp		exit;

exit:
	ret