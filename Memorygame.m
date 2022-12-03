%% MEMORY GAME

%{
create a scene using the provided retro cards image
    16x16 pixel-sprites
    magnification = 4
    off-white background
%}


card_scene = simpleGameEngine('retro_cards.png',16,16,4,[245,245,245]);
card_scene2 = simpleGameEngine('retro_cards.png',16,16,8,[167,177,183]);
%Makes a array from 1-100
sprite_sheet_contents = [1:10; 11:20; 21:30; 31:40; 41:50; 51:60; 61:70; 71:80; 81:90; 91:100]

drawScene(card_scene,sprite_sheet_contents)

cardback = [3, 3, 3, 3, 3,3; 3, 3, 3, 3, 3, 3]

drawScene(card_scene2,[cardback])


Ohio_State_Color = '#0072BD'
%Random int between 21-33
cards=randi([21 72],1,6)

recards=zeros(1,6)
recards=cards(randperm(length(cards)))
%declare points initial value
points = 10;

win = 0

while win == 0
    [x,y] = getMouseInput(card_scene2)
    if cardback(x,y)~=1

        if(x == 1)
            cardback(x,y) = cards(y)
            input1 = cards(y)
            x1 = x
            y1 = y
        else
            cardback(x,y) = recards(y)
            input1 = recards(y)
            x1 = x
            y1 = y
        end
        drawScene(card_scene2,[cardback])

        % Repeat

        [x,y] = getMouseInput(card_scene2)
        if(x == 1)
            cardback(x,y) = cards(y)
            input2 = cards(y)
        else
            cardback(x,y) = recards(y)
            input2 = recards(y)
        end
        drawScene(card_scene2,[cardback])
        %If win...
        if input1 == input2
            points = points + 2
            pause(0.5)
            cardback(x,y) = 1
            cardback(x1,y1) = 1
            drawScene(card_scene2,[cardback])
        else
            points = points - 1
            pause(0.5)
            for i = 1:12
                if cardback(i) ~= 1
                    cardback(i) = 3
                end
            end
            drawScene(card_scene2,[cardback])
        end

        for i = 1:12
            if cardback(i)~=1
                win = 0;
                break
            else
                win = 1;
            end
        end
    end
end


%title("Congrats! You scored " + string(points)+ " points!")
%Main=figure('Position',[200 300 700 350],'Color',Ohio_State_Color,'MenuBar','none','NumberTitle','off','pointer','hand');
Text=uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',"You Scored "+string(points)+" points!"...
    ,'BackgroundColor',Ohio_State_Color,'FontSize',22,'FontWeight','bold','ForegroundColor','k')

playAgain=uicontrol('style','pushbutton','Position',[180,80,180,180],'String',"Play Again?",'UserData','playAgain')
playAgain.Callback= {@replay,1}
EndGame=uicontrol('style','pushbutton','Position',[580,80,180,180],'String',"End Game")