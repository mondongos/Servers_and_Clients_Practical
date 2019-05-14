class Notes
  attr_reader :create_note, :view_notes
  def initialize
    @notes = []
  end

  def create_note(note)
    @note = note
    @notes << @note
  end

  def view_notes
    @notes
  end
end
