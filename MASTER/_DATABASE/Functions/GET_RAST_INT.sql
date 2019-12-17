--
-- GET_RAST_INT  (Function) 
--
CREATE OR REPLACE FUNCTION MASTER.Get_Rast_Int
 (nom_zd# VARCHAR2)
RETURN VARCHAR2
AS
  rast# NUMBER;
  val# VARCHAR2(50);
BEGIN
  BEGIN
    SELECT KLS_STAN.rast INTO rast# FROM MONTH,KLS_STAN 
      WHERE MONTH.STAN_ID=KLS_STAN.ID AND MONTH.nom_zd=nom_zd#;
	rast#:=NVL(rast#,0);  
  EXCEPTION
	WHEN OTHERS THEN
	  rast#:=0;
  END;	  

  val#:='';	
  IF rast#<501 THEN
    val#:='(�� 500 ��)';
  ELSE		
    IF rast#<1001 THEN
      val#:='(�� 501 �� 1000 ��)';
	ELSE  
      IF rast#<1501 THEN
        val#:='(�� 1001 �� 1500 ��)';
	  ELSE  
        IF rast#<2001 THEN
          val#:='(�� 1501 �� 2000 ��)';
        ELSE  
          IF rast#<2501 THEN
            val#:='(�� 2001 �� 2500 ��)';
          ELSE  
            IF rast#<3001 THEN
              val#:='(�� 2501 �� 3000 ��)';
			ELSE  
              IF rast#<3501 THEN
                val#:='(�� 3001 �� 3500 ��)';
			  ELSE	
                IF rast#<4001 THEN
                  val#:='(�� 3501 �� 4000 ��)';
				ELSE  
                  IF rast#<4501 THEN
                    val#:='(�� 4001 �� 4500 ��)';
                  ELSE  
                    IF rast#<5001 THEN
                      val#:='(�� 4501 �� 5000 ��)';
                    ELSE  
                      IF rast#<5501 THEN
                        val#:='(�� 5001 �� 5500 ��)';
                      ELSE  
                        IF rast#<6001 THEN
                          val#:='(�� 5501 �� 6000 ��)';
						ELSE  
                          IF rast#<6501 THEN
                            val#:='(�� 6001 �� 6500 ��)';
						  ELSE	
                            IF rast#<7001 THEN
                              val#:='(�� 6501 �� 7000 ��)';
							ELSE  
                              IF rast#<7501 THEN
                                val#:='(�� 7001 �� 7500 ��)';
	  				  	  	  ELSE  
                                IF rast#<8001 THEN
                                  val#:='(�� 7501 �� 8000 ��)';
							    ELSE  
                                  IF rast#<8501 THEN
                                    val#:='(�� 8001 �� 8500 ��)';
							      ELSE  
                                    IF rast#<9001 THEN
                                      val#:='(�� 8501 �� 9000 ��)';
							        ELSE  
                                      val#:='(����� 9000 ��)';
									END IF;
								  END IF;
								END IF;
							  END IF;
							END IF;
						  END IF;	  	  	  
  				        END IF;
					  END IF;
					END IF;
				  END IF;	  	
				END IF;  	
			  END IF;	  
			END IF;  
          END IF;  
		END IF;  
 	  END IF;  
	END IF;  
  END IF;  

  RETURN val#;
END Get_Rast_Int;

/

