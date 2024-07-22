temperatura = 38  # Temperatura teste


def teste_febre(temp):
    if temp > 38:  # Paciente com febre
        return 1
    else:  # Paciente com temperatura normal
        return 0


status_paciente = teste_febre(temperatura)
