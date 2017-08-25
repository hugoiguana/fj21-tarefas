------------------------------------------------------------------------------
CREATE SEQUENCE public.tarefas_id_seq
    INCREMENT 1
    START 1
;

ALTER SEQUENCE public.tarefas_id_seq
    OWNER TO postgres;
------------------------------------------------------------------------------
-- Table: public.tarefas

-- DROP TABLE public.tarefas;

CREATE TABLE public.tarefas
(
    id integer NOT NULL DEFAULT nextval('tarefas_id_seq'::regclass),
    descricao character(255) COLLATE pg_catalog."default",
    finalizado boolean,
    "dataFinalizacao" date,
    CONSTRAINT tarefas_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.tarefas
    OWNER to postgres;
------------------------------------------------------------------------------