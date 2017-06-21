class TimedTaskSerializer < OmmitNilSerializer
  attributes :id, :status, :cron, :next_run

  has_one :thing
  has_one :scenario

  def next_run
    object.delayed_job.run_at
  end
end