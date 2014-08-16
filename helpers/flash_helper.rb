module FlashHelper
  def flash?
    @flash ||= flash[:notice] || error
  end

private

  def error
    if flash[:model]
      flash[:model].errors.full_messages.map { |msg| humanize(msg) }.join("<br>")
    else
      flash[:error]
    end
  end
end
