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

segment .text
	global ft_read

ft_read:
	mov 	rax, 0x2000003	; set call to read
	syscall					; call rax (read)
		jc exit_error		; if doesn't work, read set flags carry to 1 so jmp exit error
	jmp exit				; jump exit

exit_error:
	mov 	rax, -1			; set return to -1s
	ret						; return
	
exit:
	ret						; return 