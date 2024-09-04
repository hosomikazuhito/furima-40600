require 'rails_helper'

RSpec.describe 'File Path Check' do
  it 'checks if the file exists' do
    path = Rails.root.join('spec', 'fixtures', 'default_image.png')
    expect(File).to exist(path)
  end
end