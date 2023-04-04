class User < ActiveRecord::Migration[7.0]
  def change
   
    private
      self.posts_counter ||= 0
    
  end
end
