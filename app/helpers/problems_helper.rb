module ProblemsHelper
  
  def link_to_add_problem_choice(name, f)
    pc = ProblemChoice.new
    fields = f.fields_for(:problem_choices, pc, :child_index => "new_problem_choice") do |builder|
      render("problem_choice_fields", :f => builder)
    end
    link_to_function(name, "add_problem_choice_fields (this, \"#{escape_javascript(fields)}\")", :id => "add_problem_choice_link")
  end

end
