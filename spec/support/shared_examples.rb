shared_examples 'requires_sign_in' do 
  it 'requires the user to be signed in' do 
    action 
    expect(response).to redirect_to signin_path 
  end
end 