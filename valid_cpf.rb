# código irá pegar e fazer a validação do CPF informado

# faz a captura do número de CPF convertendo em uma string
print "Digite o CPF: "
cpf = gets.chomp.to_s
# faz a conversão da string em um array e converte todos os itens do array e números inteiros
cpf = cpf.split('').map{|s| s.to_i}
# comando para fazer a checagem do cpf
def check_cpf(cpf)
    return false if cpf.empty?
    # verifica se o valor adcionado consta no campo de nulos
    nulos = %w{12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000 12345678909}
    unless nulos.member? (cpf.join)
        # verifica o tamanho do cpf para tomada de dicisão
        if cpf.length == 11
            # faz o cálculo para verificação do primeiro número de controle
            soma = 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8]
            soma = (soma * 10) % 11
            resultado1 = (soma == 10 or soma == 11) ? 0 : soma
            # faz o cálculo para verificação do segundo número de controle
            if resultado1 == cpf[9]
                soma = 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8] + 2 * cpf[9]
                soma = (soma * 10) % 11
                resultado2 = (soma == 10 or soma == 11) ? 0 : soma
                return true if resultado2 == cpf[10]
            end
        end
    end
    return false
end

puts check_cpf(cpf)