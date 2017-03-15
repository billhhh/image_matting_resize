function UszImg = Upsize (IOrg)

           [row,col,layer] = size(IOrg);
           
           for i = 1:row
              for j = 1:col
                  for k = 1:layer
                      ResImg(i*2-1,j*2-1,k) = IOrg(i,j,k);
                      ResImg(i*2-1,j*2,k) = IOrg(i,j,k);
                      ResImg(i*2,j*2-1,k) = IOrg(i,j,k);
                      ResImg(i*2,j*2,k) = IOrg(i,j,k);
                  end
              end
           end
               
            
          %% Return The results -------------------------------------------
          
               UszImg = ResImg ; 

          
          % ---------------------------------------------------------------
            
            
    end