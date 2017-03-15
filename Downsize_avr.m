function DszImg = Downsize_avr (IOrg)

           [row,col,layer] = size(IOrg);
           
           for i = 1:2:row
              for j = 1:2:col
                  for k = 1:layer
                      pixel_avr = (IOrg(i,j,k)+IOrg(i,j+1,k)+IOrg(i+1,j,k)+IOrg(i+1,j+1,k))/4;
                      ResImg((i+1)/2,(j+1)/2,k) = pixel_avr;
                  end
              end
           end
               
            
          %% Return The results -------------------------------------------
          
               DszImg = ResImg ; 

          
          % ---------------------------------------------------------------
            
            
    end