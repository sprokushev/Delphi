--
-- TEST_PSV  (Procedure) 
--
CREATE OR REPLACE PROCEDURE SNP_REPL.test_psv as
begin
  parus.pkg_updatelist.drop_register(null,null);
  update faceacc set prn=prn where rn=1224392;
  commit;
  parus.pkg_updatelist.set_register(null,null);
end;
/


