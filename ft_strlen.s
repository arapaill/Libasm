# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 10:46:09 by user42            #+#    #+#              #
#    Updated: 2021/02/10 10:46:09 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; 1st arg           Stack           EBX               RDI            RDI
; 2nd arg           Stack           ECX               RSI            RSI
; 3rd arg           Stack           EDX               RDX            RDX
; 4th arg           Stack           ESI               RCX            R10
; 5th arg           Stack           EDI               R8             R8
; 6th arg           Stack           EBP               R9  

; ft_strlen(arg0 = rdi = char *s)

segment .text
	global _ft_strlen

_ft_strlen:
	mov		rax, 0; Move 0 to register rax
	jmp		count; jump to fct count

count:
	cmp		BYTE[rdi + rax], 0 ; if the byte of the arg0 + the compt rax equal 0
	je		exit ; go to fct exit
	inc		rax ; else incremant rax
	jmp		count

exit:
	ret ; return rax