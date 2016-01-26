module OferringsHelper
  def toast(color, text)
    flash[:notice] = text
    flash[:state] = color
  end
end
