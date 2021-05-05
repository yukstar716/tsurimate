module PostHelper

  def random_image
    images = ["4017264_s.jpg", "4268892_s.jpg", "4050477_s.jpg",
      "4462565_s.jpg", "4393394_s.jpg", "4470254_s.jpg", 
      "4807799_s.jpg", "4778092_s.jpg", "4393394_s.jpg", 
      "4470254_s.jpg", "4699502_s.jpg", "4807799_s.jpg", 
      "4866382_s.jpg", "animal-21668_640.jpg", "fishing-4933219_640.jpg", 
      "fishing-boat-5541327_640.jpg", "PP_turibito_TP_V4.jpg", 
      "4516108_s.jpg", "4570534_s.jpg", "4778092_s.jpg", 
      "fisherman-4601744_640.jpg", "fishing-1209253_640.jpg", 
      "fishing-5552310_640.jpg", "man-336482_640.jpg", 
      "underwater-123282_1280.jpg"]
    get_image = asset_path("#{images.shuffle.first}")
  end
end
