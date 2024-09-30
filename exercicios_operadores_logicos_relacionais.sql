-- Active: 1727015344955@@127.0.0.1@5432@20242_fatec_ipi_pbdi_theo@public

--Codigo de gerar valor aleatorio
CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;

--Exercicio 1.1 - Fazendo com IF
DO
$$
DECLARE
    numero INT := valor_aleatorio_entre(0, 20);
BEGIN
    IF numero % 3 = 0 THEN
        RAISE NOTICE 'O número % é multiplo de 3', numero;
    ELSE
        RAISE NOTICE 'O número % não é multiplo de 3', numero;
    END IF;
END;
$$

--Exercicio 1.1 - Fazendo com CASE
DO
$$
DECLARE
    numero INT := valor_aleatorio_entre(0, 20);
BEGIN
    CASE
        WHEN numero % 3 = 0 THEN
            RAISE NOTICE 'O numero % é multiplo de 3', numero;
        WHEN numero % 3 <> 0 THEN
            RAISE NOTICE 'O numero % não é multiplo de 3', numero;
    END CASE;
END;
$$

--Exercicio 1.2 - Fazendo com IF
DO
$$
DECLARE
    numero INT:= valor_aleatorio_entre(0,20);
BEGIN
    IF (numero % 3 = 0) OR (numero % 5 = 0) THEN
        RAISE NOTICE 'O número % é multiplo de 3 ou 5', numero;
    ELSE
        RAISE NOTICE 'O número % não é multiplo de 3 ou 5', numero;
    END IF;
END;
$$

--Exercicio 1.2 - Fazendo com CASE
DO
$$
DECLARE
    numero INT := valor_aleatorio_entre(0,20);
BEGIN
    CASE
        WHEN (numero % 3 = 0) OR (numero % 5 = 0) THEN
            RAISE NOTICE 'O numero % é multiplo de 3 ou 5', numero;
        WHEN (numero % 3 <> 0) OR (numero % 5 <> 0) THEN
            RAISE NOTICE 'O numero % não é multiplo de 3 ou 5', numero;
    END CASE;
END;
$$

-- Exercicio 1.3 - Fazendo com IF
DO
$$
DECLARE
    menu INT := valor_aleatorio_entre(1,4);
    numero1 INT := valor_aleatorio_entre(0,20);
    numero2 INT := valor_aleatorio_entre(0,20);
    numero_divisao1 NUMERIC(10,2) := valor_aleatorio_entre(0,20);
    numero_divisao2 NUMERIC (10,2):= valor_aleatorio_entre(0,20);
    resultado INT;
    resultado_divisao NUMERIC(10,2);
BEGIN
    RAISE NOTICE 'o menu escolhido foi o %', menu;
    IF menu = 1 THEN
        resultado = numero1 + numero2;
        RAISE NOTICE '% + % = %', numero1, numero2, resultado;
    ELSEIF menu = 2 THEN
        resultado = numero1 - numero2;
        RAISE NOTICE '% - % = %', numero1, numero2, resultado;
    ELSEIF menu = 3 THEN
        resultado = numero1 * numero2;
        RAISE NOTICE '% * % = %', numero1, numero2, resultado;
    ELSE
        resultado_divisao = numero_divisao1 / numero_divisao2;
        RAISE NOTICE '% / % = %', numero_divisao1, numero_divisao2, resultado_divisao;
    END IF;
END
$$

--Exercicio 1.3 Fazendo com CASE
DO
$$
DECLARE
    menu INT := valor_aleatorio_entre(1,4);
    numero1 INT := valor_aleatorio_entre(0,20);
    numero2 INT := valor_aleatorio_entre(0,20);
    numero_divisao1 NUMERIC(10,2) := valor_aleatorio_entre(0,20);
    numero_divisao2 NUMERIC(10,2) := valor_aleatorio_entre(0,20);
    resultado INT;
    resultado_divisao NUMERIC(10,2);
BEGIN
    RAISE NOTICE 'O menu escolhido foi o %', menu;
    CASE menu
        WHEN 1 THEN
            resultado = numero1 + numero2;
            RAISE NOTICE '% + % = %', numero1, numero2, resultado;
        WHEN 2 THEN
            resultado = numero1 - numero2;
            RAISE NOTICE '% - % = %', numero1, numero2, resultado;
        WHEN 3 THEN
            resultado = numero1 * numero2;
            RAISE NOTICE '% * % = %', numero1, numero2, resultado;
        WHEN 4 THEN
            resultado_divisao = numero_divisao1 / numero_divisao2;
            RAISE NOTICE '% / % = %', numero_divisao1, numero_divisao2, resultado_divisao;
    END CASE;
END;
$$

--Exercicio 1.4 - Fazendo com IF
DO
$$
DECLARE
    valor NUMERIC(10,2) := valor_aleatorio_entre(0,40);
    lucro NUMERIC(10,2) := valor_aleatorio_entre(0,40);
BEGIN
    IF valor < 20 THEN
        lucro = (0.45 * valor) + valor;
    ELSE
        lucro = (0.30 * valor) + valor;
    END IF;
    RAISE NOTICE 'O valor do produto sem lucro é %', valor;
    RAISE NOTICE 'O valor do produto com o lucro é de %', lucro;
END;
$$

--Exercicio 1.4 - Fazendo com CASE
DO
$$
DECLARE
    valor NUMERIC(10,2) := valor_aleatorio_entre(0,40);
    lucro NUMERIC(10,2) := valor_aleatorio_entre(0,40);
BEGIN
    CASE
        WHEN valor < 20 THEN
            lucro = (0.45 * valor) + valor;
        ELSE
            lucro = (0.30 * valor) + valor;
    END CASE;
    RAISE NOTICE 'O valor do produto sem lucro é %', valor;
    RAISE NOTICE 'O valor do produto com o lucro é de %', lucro;
END;
$$

--Exercicio 1.5 - Fazendo com IF
DO
$$
DECLARE
    salario NUMERIC(10,2) := valor_aleatorio_entre(0,3000);
    aumento NUMERIC(10,2);
    salario_final NUMERIC(10,2);
BEGIN
    IF salario <= 400 THEN
        aumento = 0.15 * salario;
        salario_final = aumento + salario;
        RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
        RAISE NOTICE 'Novo salario com aumento: %', salario_final;
        RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
        RAISE NOTICE 'O percentual obtido foi: 15%%';
    ELSEIF salario <= 800 THEN
        aumento = 0.12 * salario;
        salario_final = aumento + salario;
        RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
        RAISE NOTICE 'Novo salario com aumento: %', salario_final;
        RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
        RAISE NOTICE 'O percentual obtido foi: 12%%';
    ELSEIF salario <= 1200 THEN
        aumento = 0.10 * salario;
        salario_final = aumento + salario;
        RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
        RAISE NOTICE 'Novo salario com aumento: %', salario_final;
        RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
        RAISE NOTICE 'O percentual obtido foi: 10%%';
    ELSEIF salario <=2000 THEN
        aumento = 0.07 * salario;
        salario_final = aumento + salario;
        RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
        RAISE NOTICE 'Novo salario com aumento: %', salario_final;
        RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
        RAISE NOTICE 'O percentual obtido foi: 7%%';
    ELSE
        aumento = 0.04 * salario;
        salario_final = aumento + salario;
        RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
        RAISE NOTICE 'Novo salario com aumento: %', salario_final;
        RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
        RAISE NOTICE 'O percentual obtido foi: 4%%';
    END IF;
END;
$$

--Exercicio 1.5 - Fazendo com CASE
DO
$$
DECLARE
    salario NUMERIC(10,2) := valor_aleatorio_entre(0,3000);
    aumento NUMERIC(10,2);
    salario_final NUMERIC(10,2);
BEGIN
    CASE
        WHEN salario <= 400 THEN
            aumento = 0.15 * salario;
            salario_final = aumento + salario;
            RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
            RAISE NOTICE 'Novo salario com aumento: %', salario_final;
            RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
            RAISE NOTICE 'O percentual obtido foi: 15%%';
        WHEN salario <= 800 THEN
            aumento = 0.12 * salario;
            salario_final = aumento + salario;
            RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
            RAISE NOTICE 'Novo salario com aumento: %', salario_final;
            RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
            RAISE NOTICE 'O percentual obtido foi: 12%%';
        WHEN salario <= 1200 THEN
            aumento = 0.10 * salario;
            salario_final = aumento + salario;
            RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
            RAISE NOTICE 'Novo salario com aumento: %', salario_final;
            RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
            RAISE NOTICE 'O percentual obtido foi: 10%%';
        WHEN salario <=2000 THEN
            aumento = 0.07 * salario;
            salario_final = aumento + salario;
            RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
            RAISE NOTICE 'Novo salario com aumento: %', salario_final;
            RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
            RAISE NOTICE 'O percentual obtido foi: 7%%';
        ELSE
            aumento = 0.04 * salario;
            salario_final = aumento + salario;
            RAISE NOTICE 'Salario antigo antes do aumento: %', salario;
            RAISE NOTICE 'Novo salario com aumento: %', salario_final;
            RAISE NOTICE 'O valor do reajuste ganho: %', aumento;
            RAISE NOTICE 'O percentual obtido foi: 4%%';
    END CASE;
END;
$$
