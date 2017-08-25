CREATE OR REPLACE PACKAGE qualif AS
	FUNCTION init_alloc(
		pOrin NUMBER,
		pStore NUMBER,
		dDeliveryDate DATE,
		pQuantity NUMBER,
		pContext VARCHAR2 default 'I',
		sDescription VARCHAR2 default  'No description',
		sComment VARCHAR2 default 'NO COMMENT') RETURN INT; 	
END qualif;
