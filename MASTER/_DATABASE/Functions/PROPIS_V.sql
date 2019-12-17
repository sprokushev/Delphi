--
-- PROPIS_V  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.PROPIS_V(cc VARCHAR2, atr NUMBER, all_cc VARCHAR2)
  RETURN VARCHAR2 IS
  s NUMBER;
  d NUMBER;
  o NUMBER;
  Err NUMBER;
  res VARCHAR2(50);
  sto VARCHAR2(50);
  des VARCHAR2(50);
  ons VARCHAR2(50);
  ending VARCHAR2(50);
BEGIN
  S:=TO_NUMBER(SUBSTR(cc,1,1));
  D:=TO_NUMBER(SUBSTR(cc,2,1));
  O:=TO_NUMBER(SUBSTR(cc,3,1));
  if atr=1 then
    ending:='( ' || all_cc || ' ) ����';
  else if atr=2 then
          ending:='�����';
	   else if atr=3 then
               ending:='���������';
			else
               ending:='����������';
			end if;
	   end if;
  end if;
  if s=0 then
     sto := '';
  else if s=1 then
          sto := '���';
	   else if s=2 then
	           sto := '������';
			else if s=3 then
                    sto := '������';
				 else if s=4 then
                         sto := '���������';
                      else if s=5 then
                              sto := '�������';
				           else if s=6 then
                                   sto := '��������';
				                else if s=7 then
                                        sto := '�������';
				                     else if s=8 then
                                             sto := '���������';
				                          else
                                             sto := '���������';
										  end if;
  								     end if;
							    end if;
  			  		       end if;
				      end if;
			     end if;
		    end if;
	   end if;
  end if;
  if d=0 then
    des := '';
  else if d=1 then
          IF o = 0 Then
		     des := '������';
          ELSE
		     des := '�������';
		  END IF;
	   else if d=2 then
               des := '��������';
			else if d=3 then
                    des := '��������';
				 else if d=4 then
                         des := '�����';
					  else if d=5 then
                              des := '���������';
						   else if d=6 then
                                   des := '����������';
								else if d=7 then
                                        des := '���������';
									 else if d=8 then
                                             des := '�����������';
										  else
                                             des := '���������';
										  end if;
  								     end if;
							    end if;
  			  		       end if;
				      end if;
			     end if;
		    end if;
	   end if;
  end if;
  if o=0 then
    ons := '';
  else if o=1 then
         IF (atr = 2) AND (d <> 1) Then
		   ons := '����';
         ELSE
		   ons := '����';
		 END IF;
         if d<>1 then
           if atr=1 then
              ending:='( ' || all_cc || ' ) �����';
		   else if atr=2 then
                   ending:='������';
				else if atr=3 then
                        ending:='�������';
					 else
                        ending:='��������';
					 end if;
  			    end if;
		   end if;
         end if;
       else if o=2 then
               IF (atr = 2) OR (d = 1) Then
			     ons := '���';
               ELSE
			     ons := '���';
			   END IF;
               if d<>1 then
                 if atr=1 then
                    ending:='( ' || all_cc || ' ) �����';
                 else if atr=2 then
                         ending:='������';
				      else if atr=3 then
                              ending:='��������';
					       else
                              ending:='���������';
 					       end if;
  			          end if;
		         end if;
               end if;
			else if o=3 then
                    ons := '���';
                    if d<>1 then
                      if atr=1 then
                         ending:='( ' || all_cc || ' ) �����';
                      else if atr=2 then
                              ending:='������';
				           else if atr=3 then
                                   ending:='��������';
					            else
                                   ending:='���������';
 					            end if;
  			               end if;
		              end if;
                    end if;
 			     else if o=4 then
                         ons := '�����';
                         IF (d <> 1) Then
                           ons := ons || '�';
                           if atr=1 then
                              ending:='( ' || all_cc || ' ) �����';
                           else if atr=2 then
                                   ending:='������';
				                else if atr=3 then
                                        ending:='��������';
					                 else
                                        ending:='���������';
       					             end if;
  			                    end if;
		                   end if;
						 END IF;
    			      else if o=5 then
                              ons := '���';
                              IF (d <> 1) Then
							    ons := ons || '�';
							  END IF;
    			           else if o=6 then
                                   ons := '����';
                                   IF (d <> 1) Then
								     ons := ons || '�';
								   END IF;
                                else if o=7 then
                                        ons := '���';
                                        IF (d <> 1) Then
										   ons := ons || '�';
										END IF;
									 else if o=8 then
                                             ons := '�����';
                                             IF (d <> 1) Then
											    ons := ons || '�';
											 END IF;
										  else
                                             ons := '�����';
                                             IF (d <> 1) Then
											    ons := ons || '�';
											 END IF;
										  end if;
  								     end if;
							    end if;
  			  		       end if;
				      end if;
			     end if;
		    end if;
	   end if;
  end if;
  IF d = 1 Then
    res := LTRIM(RTRIM(sto || ' ' || ons || des)) || ' ';
  ELSE
    res := LTRIM(RTRIM(sto || ' ' || des || ' ' || ons)) || ' ';
  END IF;
  IF res=' ' Then
    IF atr=1 then
	  RETURN ending;
    Else
	  RETURN '';
	END IF;
  ELSE
    RETURN (res || ending);
  END IF;
END;

/

