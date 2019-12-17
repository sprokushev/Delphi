/* Formatted on 2003/09/24 17:37 (Formatter Plus v4.8.0) */
SELECT Ttn.Ttn_date, Ttn.Ttn_numb, Pbe.Pbe_parus_abbr, St.Store_parus_abbr,
       Agn.Agn_parus_facc, Agn.Agn_parus_agnabbr, Fifo.Agn_parus_agnabbr,
       Fifo.Agn_parus_facc, Nom.Nomn_parus_modif, Nom.Nomn_parus_pack,
       Ttn.Ttn_ei, Ttn.Ttn_quan, Ttn.Ttn_koef, Ttn.Ttn_price, Ttn.Ttn_sumwon,
       Ttn.Ttn_nds, Ttn.Ttn_sumwn
  FROM RUI_ARX_TTN Ttn,
       RUI_ARX_STORE St,
       RUI_ARX_PBE Pbe,
       RUI_ARX_AGN Agn,
       RUI_ARX_AGN Fifo,
       RUI_ARX_DICNOMN Nom
 WHERE (    (Ttn.Ttn_pbe = Pbe.Pbe_id)
        AND (Ttn.Ttn_store = St.Store_id)
        AND (Ttn.Ttn_agn = Agn.Agn_id)
        AND (Ttn.Ttn_fifo = Fifo.Agn_id)
        AND (Ttn.Ttn_nomen = Nom.Nomn_id)
       )
