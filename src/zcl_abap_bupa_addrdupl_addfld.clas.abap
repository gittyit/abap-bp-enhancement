class ZCL_ABAP_BUPA_ADDRDUPL_ADDFLD definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_GET_ADDITIONAL_FIELDS .
protected section.
private section.

  constants MC_STRUCTURE1 type STRING value 'BUSDUPL_ADDR_FLDS'.
ENDCLASS.



CLASS ZCL_ABAP_BUPA_ADDRDUPL_ADDFLD IMPLEMENTATION.


  method IF_GET_ADDITIONAL_FIELDS~GET_ADDITIONAL_DATA.
  endmethod.


  METHOD if_get_additional_fields~get_additional_fields.

    CHECK screen_structure = mc_structure1.

* Add new field from enhancement of BUSDUPL_ADDR_FLDS
    LOOP AT et_field_catalog ASSIGNING FIELD-SYMBOL(<fs_fc>).

      CASE <fs_fc>-fieldname.
        WHEN 'ZZ_FIELD1'.
          CLEAR: <fs_fc>-no_out.
        WHEN OTHERS.
      ENDCASE.
    ENDLOOP.

    APPEND VALUE #( fieldname = 'LEGAL_ORG'
                    tabname = 'BUT000'
                    col_pos = '1' ) TO et_cust_fields.

  ENDMETHOD.
ENDCLASS.
