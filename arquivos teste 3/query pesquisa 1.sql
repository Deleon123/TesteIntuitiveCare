SELECT dc.REG_ANS, roa.Razao_Social, SUM(CAST(dc.VL_SALDO_FINAL as DECIMAL(10,2))-CAST(dc.VL_SALDO_INICIAL as DECIMAL(10,2))) FROM demonstracoes_contabeis AS dc 
JOIN relacao_de_operadoras_ativas AS roa 
ON dc.REG_ANS = roa.Registro_ANS 
where dc.DESCRICAO = "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" and dc.Data_tempo = "2021-10-01"
group by dc.REG_ANS 
ORDER BY SUM(CAST(dc.VL_SALDO_FINAL as DECIMAL(10,2))-CAST(dc.VL_SALDO_INICIAL as DECIMAL(10,2))) ASC
LIMIT 10

-- Query que descobre as 10 empresas que mais tiveram gastos em EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR, no último trimestre (data 2021-10-01)