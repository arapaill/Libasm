# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 10:46:09 by user42            #+#    #+#              #
#    Updated: 2021/02/10 10:46:09 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

extern __errno_location
global ft_read

section .text
ft_read:
    mov rax, 0x00 ; sys_write
    syscall     ; call write
    cmp rax, 0
    jl error
    ret
error:
    neg rax    ; get absolute value of syscall return
    mov rdi, rax
    call __errno_location wrt ..plt
    mov [rax], rdi  ; set the value of errno
    mov rax, -1
    ret