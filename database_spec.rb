require_relative './database'

describe 'Simple Database' do

  it 'starts with no variables' do
    expect(database).to be_empty
  end 

  context 'Data Commands' do
    before { set("a", 10) }

    it 'can set a new variable' do
      expect(@database["a"]).to eq [10] 
    end

    it 'can set multiple variables' do
      set("b", 20)
      expect((database.length)>1).to be true
    end

    it 'records historical values of a name' do
      set("a", 20)
      expect(@database["a"][0]).to eq 10 
      expect(@database["a"][-1]).to eq 20 
    end

    it 'can get to current value of a variable by its name' do
      expect(get("a")).to eq 10
    end

    it 'displays number of variables with same current value' do
      set("a", 20)
      set("b", 20)
      expect(numequalto(20)).to eq 2
    end

    it 'deletes variables' do
      unset("a")
      expect(@database["a"]).to eq nil
    end
  end

  context 'Transaction Commands' do
    it 'can open a new transaction block' do

    end
  end
end