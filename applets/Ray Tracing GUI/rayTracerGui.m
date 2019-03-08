function rayTracerGui()

lensIndex=1;

point=RayPoints(1,2,0.1,1,calculateVisibleSpectrumColor(500));

lensArray=Lens(0,0,0,0,0,0,0);
basicFig= figure('Name','Raytracer');
newLens=uicontrol(basicFig,'Style','pushbutton','String','New Lens','Position',[5 5 100 20],'Callback',@nLens); %callback
editLens=uicontrol(basicFig,'Style','pushbutton','String','Edit Lens','Position',[115 5 100 20],'Callback',@edLens);%callback
editPoint=uicontrol(basicFig,'Style','pushbutton','String','Edit Point','Position',[220 5 100 20],'Callback',@edPoint);%callback
clear=uicontrol(basicFig,'Style','pushbutton','String','Clear','Position',[330 5 100 20],'Callback',@cl);%callback
ok=uicontrol(basicFig,'Style','pushbutton','String','Ok','Position',[450 5 100 20],'Visible','on','Callback',@callPlot); %callback


    function callPlot(source,callbackdata)
       %uipanel(basicFig,'Position',[0 500 600 300]); 
       plotGui(lensArray,point,1) 
    end

    function  nLens(source, callbackdata)
       
        nLensFig=figure('Name','Lens Editor');
        uicontrol(nLensFig,'Style','text','String','position [0,500]','Position',[5 400 200 20])
        uicontrol(nLensFig,'Style','text','String','height [0,50]','Position',[5 350 200 20])
        uicontrol(nLensFig,'Style','text','String','distance [0,10]','Position',[5 300 200 20])
        uicontrol(nLensFig,'Style','text','String','refractive index [1,5]','Position',[5 250 200 20])
        uicontrol(nLensFig,'Style','text','String','R1 [-1M,1M]','Position',[5 200 200 20])
        uicontrol(nLensFig,'Style','text','String','R2 [-1M,1M]','Position',[5 150 200 20])
        
        t1=uicontrol(nLensFig,'Style','slider','Min',0,'Max',500,'Value',100,'Position',[250 400 100 20] ,'Visible','on');
        t2=uicontrol(nLensFig,'Style','slider','Min',0,'Max',50,'Value',25,'Position',[250 350 100 20] ,'Visible','on');
        t3=uicontrol(nLensFig,'Style','slider','Min',0,'Max',10,'Value',5,'Position',[250 300 100 20] ,'Visible','on');
        t4=uicontrol(nLensFig,'Style','slider','Min',1,'Max',5,'Value',1.5,'Position',[250 250 100 20] ,'Visible','on');
        t5=uicontrol(nLensFig,'Style','slider','Min',-1000000,'Max',1000000,'Value',20,'Position',[250 200 100 20] ,'Visible','on');
        t6=uicontrol(nLensFig,'Style','slider','Min',-1000000,'Max',1000000,'Value',20,'Position',[250 150 100 20] ,'Visible','on');
       
        ok1=uicontrol(nLensFig,'Style','pushbutton','String','Ok','Position',[400 5 100 20],'Visible','on','Callback',@some1); %callback
        
        function some1(source,callbackdata)
        g1=get(t1,'value');
        g2=get(t2,'value');
        g3=get(t3,'value');
        g4=get(t4,'value');
        g5=get(t5,'value');
        g6=get(t6,'value');
        
        lensArray(lensIndex)= Lens(g1,g2,g3,g4,g5,g6,point.n);
       
        
        lensIndex=lensIndex+1;
        end
         
    end

    function edPoint(source,callbackdata)
        
        edPointFig=figure('Name','Point Editor');
        uicontrol(edPointFig,'Style','text','String','S [0,500]','Position',[5 400 200 20])
        uicontrol(edPointFig,'Style','text','String','u [0,50]','Position',[5 350 200 20])
        uicontrol(edPointFig,'Style','text','String','Phi [0,0.2]','Position',[5 300 200 20])
        uicontrol(edPointFig,'Style','text','String','refractive index [1,5]','Position',[5 250 200 20])
        uicontrol(edPointFig,'Style','text','String','Color [360,830]','Position',[5 200 200 20])
        
        p1=uicontrol(edPointFig,'Style','slider','Min',0,'Max',500,'Value',0,'Position',[250 400 100 20] ,'Visible','on');
        p2=uicontrol(edPointFig,'Style','slider','Min',0,'Max',50,'Value',1,'Position',[250 350 100 20] ,'Visible','on');
        p3=uicontrol(edPointFig,'Style','slider','Min',0,'Max',0.2,'Value',0.01,'Position',[250 300 100 20] ,'Visible','on');
        p4=uicontrol(edPointFig,'Style','slider','Min',1,'Max',5,'Value',1,'Position',[250 250 100 20] ,'Visible','on');
        p5=uicontrol(edPointFig,'Style','slider','Min',360,'Max',830,'Value',500,'Position',[250 200 100 20] ,'Visible','on');
        ok2=uicontrol(edPointFig,'Style','pushbutton','String','Ok','Position',[400 5 100 20],'Visible','on','Callback',@some2); %callback
        
        function some2(source,callbackdata)
           
            e1=get(p1,'value');
            e2=get(p2,'value');
            e3=get(p3,'value');
            e4=get(p4,'value');
            e5=floor(get(p5,'value'));
            
            
            point=RayPoints(e1,e2,e3,e4,calculateVisibleSpectrumColor(e5));
            
        end
        
    end
    
    function edLens(source,callbackdata)
        
        edLensFig=figure('Name','Lens Editor');
        uicontrol(edLensFig,'Style','text','String','position [0,500]','Position',[5 400 200 20])
        uicontrol(edLensFig,'Style','text','String','height [0,50]','Position',[5 350 200 20])
        uicontrol(edLensFig,'Style','text','String','distance [0,10]','Position',[5 300 200 20])
        uicontrol(edLensFig,'Style','text','String','refractive index [1,5]','Position',[5 250 200 20])
        uicontrol(edLensFig,'Style','text','String','R1 [-1M,1M]','Position',[5 200 200 20])
        uicontrol(edLensFig,'Style','text','String','R2 [-1M,1M]','Position',[5 150 200 20])
        uicontrol(edLensFig,'Style','text','String','Index','Position',[5 100 200 20])
        
        s1=uicontrol(edLensFig,'Style','slider','Min',0,'Max',500,'Value',100,'Position',[250 400 100 20] ,'Visible','on');
        s2=uicontrol(edLensFig,'Style','slider','Min',0,'Max',50,'Value',25,'Position',[250 350 100 20] ,'Visible','on');
        s3=uicontrol(edLensFig,'Style','slider','Min',0,'Max',10,'Value',5,'Position',[250 300 100 20] ,'Visible','on');
        s4=uicontrol(edLensFig,'Style','slider','Min',1,'Max',5,'Value',1.5,'Position',[250 250 100 20] ,'Visible','on');
        s5=uicontrol(edLensFig,'Style','slider','Min',-1000000,'Max',1000000,'Value',20,'Position',[250 200 100 20] ,'Visible','on');
        s6=uicontrol(edLensFig,'Style','slider','Min',-1000000,'Max',1000000,'Value',20,'Position',[250 150 100 20] ,'Visible','on');
        s7=uicontrol(edLensFig,'Style','slider','Min',1,'Max',lensIndex,'Value',1,'Position',[250 100 100 20] ,'Visible','on');
        ok3=uicontrol(edLensFig,'Style','pushbutton','String','Ok','Position',[400 5 100 20],'Visible','on','Callback',@some3); %callback
        
        function some3(source,callbackdata)
            m1=get(s1,'value');
            m2=get(s2,'value');
            m3=get(s3,'value');
            m4=get(s4,'value');
            m5=get(s5,'value');
            m6=get(s6,'value');
            m7=floor(get(s7,'value'));
            
            lensArray(m7)=Lens(m1,m2,m3,m4,m5,m6,point.n);
        end
        
    end
    
    function cl(source,callbackdata)
        
        lensIndex=1;
        lensArray=Lens(0,0,0,0,0,0,0);
        point=RayPoints(1,2,0.1,1,calculateVisibleSpectrumColor(500));
        
    end

end