Ensure the backtrace is the same as if ActiveRecord::RecordNotFound was called.
This might already happen, thanks to `rescue_from` but we need a spec at least.
