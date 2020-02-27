
--original query, deprecated from 2018/11/02
SELECT DISTINCT ai.country_code
	,rtrim(ai.manuf_serial_no)
	,rtrim(ai.contract_serial)
	,rtrim(ai.machine_type)
	,rtrim(ai.model)
	,rtrim(ai.mes)
	,rtrim(ai.asset_description)
	,coalesce(ref_pt.FIELD_TEXT, ai.product_type) product_type
	,ai.last_mod_date
	,rtrim(ai.contract_supp_no)
	,rtrim(ai.mla_no)
	,coalesce(ref_ls.FIELD_TEXT, ai.lease_status) lease_status
	,coalesce(ref_lss.FIELD_TEXT, ai.lease_sub_status) lease_sub_status
	,ai.amount_financed
	,ai.amt_financed_cur
	,pi.periodic_payment
	,pi.currency
	,coalesce(ref_pf.FIELD_TEXT, pi.payment_frequency) payment_frequency
	,ai.lease_accept_date
	,ai.lease_start_date
	,ai.lease_exp_date
	,rtrim(ai.lease_term)
	,ai.original_lease_start_date
	,ai.original_lease_end_date
	,rtrim(mu.user_last_name)
	,rtrim(mu.user_first_name)
	,rtrim(mu.user_employee_id)
	,rtrim(mu.user_division)
	,rtrim(mu.user_department)
	,rtrim(ai.inst_cust_no)
FROM ebcc.asset_item ai
LEFT OUTER JOIN ebcc.machine_user mu ON (
		ai.country_code = mu.country_code
		AND ai.contract_uniq_id = mu.contract_uniq_id
		)
LEFT OUTER JOIN ebcc.payment_information pi ON (
		ai.country_code = pi.country_code
		AND ai.contract_uniq_id = pi.contract_uniq_id
		AND ai.contract_supp_no = pi.contract_supp_no
		)
LEFT JOIN ebcc.text_reference ref_pt ON (
		ref_pt.field_name = 'PRODUCT_TYPE'
		AND ref_pt.country_code = ai.country_code
		AND ref_pt.field_value = ai.product_type
		)
LEFT JOIN ebcc.text_reference ref_ls ON (
		ref_ls.field_name = 'LEASE_STATUS'
		AND ref_ls.country_code = ai.country_code
		AND ref_ls.field_value = ai.lease_status
		)
LEFT JOIN ebcc.text_reference ref_lss ON (
		ref_lss.field_name = 'LEASE_SUB_STATUS'
		AND ref_lss.country_code = ai.country_code
		AND ref_lss.field_value = ai.lease_sub_status
		)
LEFT JOIN ebcc.text_reference ref_pf ON (
		ref_pf.field_name = 'PAYMENT_FREQUENCY'
		AND ref_pf.country_code = ai.country_code
		AND ref_pf.field_value = pi.payment_frequency
		)
WHERE ai.country_code IN ('897')
	AND ai.lease_status = '1'
	AND ai.product_type IN (
		'R'
		,'Q'
		)
	AND (
		(
			ai.inst_country_code = '897'
			AND ai.inst_le_no = '153804570'
			AND ai.inst_company IN (
				'11830674'
				,'11846891'
				,'11854393'
				,'12021355'
				,'153804570'
				,'827822946'
				)
			)
		OR (
			ai.bill_to_country = '897'
			AND ai.bill_le_no = '153804570'
			AND ai.bill_to_company IN (
				'11830674'
				,'11846891'
				,'11854393'
				,'12021355'
				,'153804570'
				,'827822946'
				)
			)
		)
ORDER BY 1
	,2
WITH ur
