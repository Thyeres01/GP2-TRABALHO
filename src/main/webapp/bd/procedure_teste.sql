-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_teste`()
BEGIN
 DECLARE x INT;
 DECLARE var_string VARCHAR(255);
 
 SET x = 1;
 SET var_string =  '';
 
 WHILE x  <= 5 DO
 SET  var_string = CONCAT(var_string,x,',');
 SET  x = x + 1; 
 END WHILE;
 
 SELECT var_string;
 END