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

