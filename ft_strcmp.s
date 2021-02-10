# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 10:46:09 by user42            #+#    #+#              #
#    Updated: 2021/02/10 10:46:09 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
	global ft_strcmp

ft_strcmp:
	mov		rcx, 0
	mov		rdx, 0
	cmp 	rdi, 0
	jz		error_null
	cmp		rsi, 0
	jz		error_null
	jmp		check_last

error_null:
	cmp rdi, rsi
	je	equal
	jg	positif
	jmp	negatif

compare:
	mov		dl, BYTE[rsi + rcx] ; tmp = s2[i]
	cmp		BYTE [rdi + rcx], dl ; look if s1[i] == tmp
	jne		last_char

increment:
			inc		rcx

check_last:
	cmp		BYTE [rdi + rcx], 0
	je		last_char
	cmp		BYTE [rsi + rcx], 0
	je		last_char
	jmp		compare

last_char:
	mov		dl, BYTE [rdi + rcx]
	sub		dl, BYTE [rsi + rcx]	; substract (rdi + rcx) and (rsi + rcx)
	cmp		dl, 0
	jz		equal
	jl		negatif

positif:
	mov		rax, 1
	ret

negatif:
	mov		rax, -1
	ret

equal:
	mov		rax, 0
	ret

