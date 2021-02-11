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
extern __errno_location
global ft_write

section .text
ft_write:
    mov rax, 0x1  ; sys_write
    syscall     ; call write
    cmp rax, 0
    jl error
    ret
error:
    neg rax    ; get absolute value of syscall return
	push rax
    call __errno_location wrt ..plt
    pop qword [rax]
    mov rax, -1
    ret