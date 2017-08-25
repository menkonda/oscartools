CREATE PACKAGE BODY qualif AS
	FUNCTION init_alloc(
		pOrin NUMBER,
		pStore NUMBER,
		dDeliveryDate DATE,
		pQuantity NUMBER,
		pContext VARCHAR2 default 'I',
		sDescription VARCHAR2 default  'No description',
		sComment VARCHAR2 default 'NO COMMENT') RETURN INT
	IS
		alloc_id au_alloc_stage.alloc_id%type;		
	BEGIN
		alloc_id :=  au_alloc_stage_seq.NEXTVAL;
		insert into au_alloc_stage(
			select
			alloc_id,
			pOrin,
			d.group_no,
			'989',
			pStore,
			1 as store_channel, --Always 1
			pQuantity as allocated_qty,
			dDeliveryDate,
			dDeliveryDate,
			pContext as context_type,
			au_alloc_stage_seq.NEXTVAL,
			sDescription,
			sComment as alloc_comment,
			'R' as status,
			null,
			null,
			null,
			sysdate,
			sysdate,
			null,
			null
			from  item_master im
			inner join deps d on d.dept = im.dept 
			where 
				1=1
				and im.ITEM_PARENT=pOrin);
		commit;
		RETURN alloc_id;
		
	END init_alloc;
	
END qualif;
/
