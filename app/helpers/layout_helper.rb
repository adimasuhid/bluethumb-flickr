module LayoutHelper
  def flash_class(level)
    {
      notice: "alert alert-info",
      success: "alert alert-success",
      error: "alert alert-danger",
      alert: "alert alert-danger"
    }[level]
  end
end
