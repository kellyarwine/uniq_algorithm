describe "Solver" do
  let(:solver) { Solver.new }

  it "returns a sorted array of inputs" do
    expect(solver.solve([2, 1])).to eq [1, 2]
  end

  it "returns a unique array when there are two duplicates" do
    expect(solver.solve([2, 2])).to eq [2]
  end

  it "returns a unique array when there are multiple duplicates" do
    expect(solver.solve([2, 2, 3, 3])).to eq [2, 3]
  end

  it "returns a unique array sorted from lowest to highest" do
      expect(solver.solve([100, 2, 4, 3, 2, 50, 16])).to eq [2, 3, 4, 16, 50, 100]
  end
end

class Solver
  def solve(inputs)
    sorted_inputs = sort(inputs)
    unique(sorted_inputs)
  end

  def sort(inputs)
    inputs.sort
  end

  def unique(sorted_inputs)
    determine_if_unique(sorted_inputs).compact
  end

  def determine_if_unique(sorted_inputs)
    sorted_inputs.each_with_index.map { |input, i| input if same_input_as_next?(input, sorted_inputs[i + 1]) || last_element?(i, sorted_inputs.length) }
  end

  def same_input_as_next?(input, next_input)
    input != next_input
  end

  def last_element?(index, array_length)
    index == array_length - 1
  end
end
