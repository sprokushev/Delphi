--
-- RUSMONTH  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.RusMonth(date1 IN DATE)
  RETURN VARCHAR2 IS
  mm_txt VARCHAR2 (20);
  mm NUMBER;
  yy VARCHAR2(4);
BEGIN
  mm:=to_number(to_char(date1,'mm'));
  yy:=to_char(date1,'yyyy');
  If mm=1 then
     mm_txt:=' ������ ';
  else if mm=2 then
          mm_txt:=' ������� ';
       else if mm=3 then
               mm_txt:=' ���� ';
            else if mm=4 then
                    mm_txt:=' ������ ';
                 else if mm=5 then
                         mm_txt:=' ��� ';
                      else if mm=6 then
                              mm_txt:=' ���� ';
                           else if mm=7 then
                                   mm_txt:=' ���� ';
                                else if mm=8 then
                                        mm_txt:=' ������ ';
                                     else if mm=9 then
                                             mm_txt:=' �������� ';
                                          else if mm=10 then
                                                  mm_txt:=' ������� ';
                                               else if mm=11 then
                                                       mm_txt:=' ������ ';
                                                    else
                                                       mm_txt:=' ������� ';
                                                    end if;
                                               end if;
                                          end if;
                                     end if;
                                end if;
                           end if;
                      end if;
                 end if;
            end if;
       end if;
  end if;
  RETURN (mm_txt || yy || ' �.');
END;

/

