{{ config(
          materialized='table',
          partition_by={
            "field": "data_referencia",
            "data_type": "date",
            "granularity": "month",
          },
          cluster_by=["versao",],) }}
SELECT
  SAFE_CAST(Data_Referencia AS DATE) AS data_referencia,
  SAFE_CAST(regexp_replace(CNPJ_Fundo, r'[^0-9]', '') AS STRING) AS cnpj_fundo,
  SAFE_CAST(substr(regexp_replace(CNPJ_Fundo, r'[^0-9]', ''), 1, 8) AS STRING) AS cnpj_basico,
  SAFE_CAST(Versao AS INT64) AS versao,
  SAFE_CAST(Total_Necessidades_Liquidez AS FLOAT64) AS total_necessidades_liquidez,
  SAFE_CAST(Disponibilidades AS FLOAT64) AS disponibilidades,
  SAFE_CAST(Titulos_Publicos AS FLOAT64) AS titulos_publicos,
  SAFE_CAST(Titulos_Privados AS FLOAT64) AS titulos_privados,
  SAFE_CAST(Fundos_Renda_Fixa AS FLOAT64) AS fundos_renda_fixa,
  SAFE_CAST(Total_Investido AS FLOAT64) AS total_investido,
  SAFE_CAST(Direitos_Bens_Imoveis AS FLOAT64) AS direitos_bens_imoveis,
  SAFE_CAST(Terrenos AS FLOAT64) AS terrenos,
  SAFE_CAST(Imoveis_Renda_Acabados AS FLOAT64) AS imoveis_renda_acabados,
  SAFE_CAST(Imoveis_Renda_Construcao AS FLOAT64) AS imoveis_renda_construcao,
  SAFE_CAST(Imoveis_Venda_Acabados AS FLOAT64) AS imoveis_venda_acabados,
  SAFE_CAST(Imoveis_Venda_Construcao AS FLOAT64) AS imoveis_venda_construcao,
  SAFE_CAST(Outros_Direitos_Reais AS FLOAT64) AS outros_direitos_reais,
  SAFE_CAST(Acoes AS FLOAT64) AS acoes,
  SAFE_CAST(Debentures AS FLOAT64) AS debentures,
  SAFE_CAST(Bonus_Subscricao AS FLOAT64) AS bonus_subscricao,
  SAFE_CAST(Certificados_Deposito_Valores_Mobiliarios AS FLOAT64) AS certificados_deposito_valores_mobiliarios,
  SAFE_CAST(Cedulas_Debentures AS FLOAT64) AS cedulas_debentures,
  SAFE_CAST(Fundo_Acoes AS FLOAT64) AS fundo_acoes,
  SAFE_CAST(FIP AS FLOAT64) AS fip,
  SAFE_CAST(FII AS FLOAT64) AS fii,
  SAFE_CAST(FDIC AS FLOAT64) AS fdic,
  SAFE_CAST(Outras_Cotas_FI AS FLOAT64) AS outras_cotas_fi,
  SAFE_CAST(Notas_Promissorias AS FLOAT64) AS notas_promissorias,
  SAFE_CAST(Acoes_Sociedades_Atividades_FII AS FLOAT64) AS acoes_sociedades_atividades_fii,
  SAFE_CAST(Cotas_Sociedades_Atividades_FII AS FLOAT64) AS cotas_sociedades_atividades_fii,
  SAFE_CAST(CEPAC AS FLOAT64) AS cepac,
  SAFE_CAST(CRI AS FLOAT64) AS cri,
  SAFE_CAST(CRI_CRA AS FLOAT64) AS cri_cra,
  SAFE_CAST(Letras_Hipotecarias AS FLOAT64) AS letras_hipotecarias,
  SAFE_CAST(LCI AS FLOAT64) AS lci,
  SAFE_CAST(LCI_LCA AS FLOAT64) AS lci_lca,
  SAFE_CAST(LIG AS FLOAT64) AS lig,
  SAFE_CAST(Outros_Valores_Mobliarios AS FLOAT64) AS outros_valores_mobliarios,
  SAFE_CAST(Valores_Receber AS FLOAT64) AS valores_receber,
  SAFE_CAST(Contas_Receber_Aluguel AS FLOAT64) AS contas_receber_aluguel,
  SAFE_CAST(Contas_Receber_Venda_Imoveis AS FLOAT64) AS contas_receber_venda_imoveis,
  SAFE_CAST(Outros_Valores_Receber AS FLOAT64) AS outros_valores_receber,
  SAFE_CAST(Rendimentos_Distribuir AS FLOAT64) AS rendimentos_distribuir,
  SAFE_CAST(Taxa_Administracao_Pagar AS FLOAT64) AS taxa_administracao_pagar,
  SAFE_CAST(Taxa_Performance_Pagar AS FLOAT64) AS taxa_performance_pagar,
  SAFE_CAST(Obrigacoes_Aquisicao_Imoveis AS FLOAT64) AS obrigacoes_aquisicao_imoveis,
  SAFE_CAST(Adiantamento_Venda_Imoveis AS FLOAT64) AS adiantamento_venda_imoveis,
  SAFE_CAST(Adiantamento_Alugueis AS FLOAT64) AS adiantamento_alugueis,
  SAFE_CAST(Obrigacoes_Securitizacao_Recebiveis AS FLOAT64) AS obrigacoes_securitizacao_recebiveis,
  SAFE_CAST(Instrumentos_Financeiros_Derivativos AS FLOAT64) AS instrumentos_financeiros_derivativos,
  SAFE_CAST(Provisoes_Contigencias AS FLOAT64) AS provisoes_contigencias,
  SAFE_CAST(Outros_Valores_Pagar AS FLOAT64) AS outros_valores_pagar,
  SAFE_CAST(Total_Passivo AS FLOAT64) AS total_passivo
FROM
   `arthur-data-engineering-course.brazilian_reits_staging.ativo_passivo_staging`

