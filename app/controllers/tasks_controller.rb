class TasksController < ApplicationController

mystring1 = "bike wash"
mystring2 = "bike wash at bike clinic"
mystring3 = "bike wash at bike clinic on 7 may 11"
mystring4 = "bike wash @ bike clinic on 7 may 11 @ 10 AM"
mystring5 = "bike wash on 7 may 11 @ 10 AM"
mystring6 = "bike wash today at 10 AM"
re1 = /(.*?)/
re = /(?<task>.*)@(.*)on(.*)@(.*)/ #is [task] @ [location] on [date] @ [time]
#/^(.*)on(.*)@(.*)/ is [task  @ [location] ]on [date] @ [time]
#/^(.*)@(.*)on(.*)/ is [task ] @ [location]  on [date]
#/^(.*)on(.*)/ is [task @ [location] ]   on [date]
#myarray = mystring.scan(/^(.*)on(.*)@(.*)/)
#myarray.each{|dsw| puts dsw}
#puts myarray
#/(?<task>.*) ( @ (?<location>.*)? ) on (?<date>.*) ( @ (?<time>.*)? ) /x =~ mystring4
#/(?<task>.*) ( @ (?<location>.*)? ) on (?<date>.*) ( @ (?<time>.*) ) /x =~ mystring5
#regex = /(?<task>.*?)(?:\s*@\s*(?<location>.*?))? (?:\s+on\s+(?<date>.*?)(?:\s*@\s*(?<time>.*))?)?\z/x
regex=/(?<task>.(?:(?! (@|at) | on ).)+)(?: (@|at) (?<location>(?:(?! on ).)+))?(?: on (?<date>(?:(?! @ ).)+)(?: @ (?<time>.+))?)?/x
#regex = /
#  (?<task>.*?)
#  (?:\s*@\s*(?<location>.*?))?
#  (?:\s+on\s+(?<date>.*?)
#    (?:\s*@\s*(?<time>.*))?
#  )?
#\z/x


  # TODO: add tags to a task
  # regex=/(?<task>.(?:(?! (@|at) | on ).)+)(?: (@|at) (?<location>(?:(?! on ).)+))?(?: on (?<date>(?:(?! @ ).)+)(?: @ (?<time>.+))?)?/x
  # GET /tasks
  # GET /tasks.xml
  def index
	@task = Task.new
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to(:action => "index", :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
end
