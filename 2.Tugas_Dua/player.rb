class Player
  attr_accessor :nama, :blood, :manna
  
  def initialize 
        @nama = Array.new
        @blood = Array.new
        @manna = Array.new
        @blood[0,1] = 100, 100
        @manna [0,1]= 50, 50
    end
    
   def get_nama
     puts"Masukan nama player 1"
     @nama[0] = gets.chomp
     puts"current player 1 : #{@nama[0]}, #{@blood[0]}, #{@manna[0]}"
    
    end
    
    def show
     puts"Masukan nama player 2" 
      @nama[1] = gets.chomp
      puts"current player 2 : #{@nama[1]}, blood : #{@blood[1]}, manna : #{@manna[1]}"
      puts @nama[0]
      puts @nama[1]
      
    end
    
    def attack
      puts"siapa yang akan menyerang"
      @nama[3] = gets.chomp
      puts"siapa yang akan diserang"
      @nama[4] = gets.chomp
      
      if @nama[3].eql? @nama[0]
        puts"#{@nama[0]} menyerang"
        @manna[0]= @manna[0]-20
        puts"Sisa manna #{@manna[0]}"
        puts "#{@nama[1]} diserang"
        @blood[1]= @blood[1]-20
        puts"Sisa blood #{@blood[1]}"
           
       
      elsif @nama[3].eql? @nama[1]
        puts"#{@nama[1]} menyerang"
      elsif @nama[4].eql? @nama[0]
        puts"#{@nama[0]} diserang"
      elsif @nama[4].eql? @nama[1]
        puts"#{@nama[1]} diserang"
      else puts"tidak ada yang menyerang"
      end
    end
    
    
      
   
      
end

get_nama = Player.new
get_nama.get_nama
get_nama.show
get_nama.attack
