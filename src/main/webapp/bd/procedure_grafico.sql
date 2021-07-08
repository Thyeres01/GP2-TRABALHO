-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_grafico`(
OUT Janeiro int,
OUT Fevereiro int,
OUT Março int,
OUT Abril int,
OUT Maio int,
OUT Junho int,
OUT Julho int,
OUT Agosto int,
OUT Setembro int,
OUT Outubro int,
OUT Novembro int,
OUT Dezembro int)
begin

-- Janeiro
select count(data_visita) into Janeiro
	from
		visita 	
	where
		data_visita between '2017-01-01' and '2017-01-31';

-- Fevereiro
select count(data_visita) into Fevereiro
	from
		visita 	
	where
		data_visita between '2017-02-01' and '2017-02-31';


-- Março
select count(data_visita) into Março
	from
		visita 	
	where
		data_visita between '2017-03-01' and '2017-03-31';

-- Abril
select count(data_visita) into Abril
	from
		visita 	
	where
		data_visita between '2017-04-01' and '2017-04-30';

-- Maio
select count(data_visita) into Maio	
	from
		visita 	
	where
		data_visita between '2017-05-01' and '2017-05-31';

-- Junho
select count(data_visita) into Junho
	from
		visita 	
	where
		data_visita between '2017-06-01' and '2017-06-30';

-- Julho
select count(data_visita) into Julho
	from
		visita 	
	where
		data_visita between '2017-07-01' and '2017-07-31';

-- Agosto
select count(data_visita) into Agosto
	from
		visita 	
	where
		data_visita between '2017-08-01' and '2017-08-31';


-- Setembro
select count(data_visita) into Setembro
	from
		visita 	
	where
		data_visita between '2017-09-01' and '2017-09-30';

-- Outubro
select count(data_visita) into Outubro
	from
		visita 	
	where
		data_visita between '2017-10-01' and '2017-10-31';

-- Novembro
select count(data_visita) into Novembro
	from
		visita 	
	where
		data_visita between '2017-11-01' and '2017-11-30';

-- Dezembro
select count(data_visita) into Dezembro
	from
		visita 	
	where
		data_visita between '2017-12-01' and '2017-01-31';
END