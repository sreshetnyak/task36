//
//  TTInfoPopoverViewController.m
//  UIPopoverController
//
//  Created by Sergey Reshetnyak on 5/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTInfoPopoverViewController.h"

@interface TTInfoPopoverViewController () <UITextViewDelegate>

@property (weak,nonatomic) UITextView *textView;

@end

@implementation TTInfoPopoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
    self.navigationItem.leftBarButtonItem = btn;
    
    self.title = @"info";
    
    CGRect rect = self.view.bounds;
    
    UITextView *textView = [[UITextView alloc]initWithFrame:rect];
    
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    textView.text = @"Поповеры надо очень хорошо отпрактиковать! Так же я рекомендую разобраться с тем, как поповер убирается из памяти (было в видео).Учтите, на айфоне поповеров нет, поэтому для айфона вместо поповеров используйте модальные контроллеры с разными транзишинами если надо.\nУченик\n1. Создайте универсальное приложение (айпад / айфон)\n2. Первый контроллер должен быть статической таблицей с навигейшн баром\n3. В правом углу на навигейшине должна быть кнопка инфо, если на нее нажать, то вылазит поповер с объяснением, что это такое за приложение :)\nСтудент\n4. В таблице создайте классические ячейки:\nимя + текстфилд\nфамилия + текстфилд\nпол + сегментед контрол (мужской/женский)\nДата рождения + текстфилд\nОбразование + текстфилд\n5. с первыми тремя ячейками все понятно, а вот дальше самое интересное\nМастер\n6. При нажатии на текст филд с датой рождения текст филду должно быть запрещено входить в режим редактирования, а вместо этого из него должен появиться поповер с UIDatePicker. При изменении даты, содержимое текст филда должно меняться (то есть мы не мучаем юзера форматами ввода, мы просто даем ему барабан с датами и предлагаем выбрать самому)\n7. Подсказка. Вам надо сделать контроллер с дейт пикером, а дейт пикер это наследник от UIControl, то есть у него есть акшин valueChanged или типо того. У контроллера нужно создать проперти делегат, по которому мы будем отправлять данные, полученные с барабана. То есть по простому: контроллер следит за барабаном и отправляет изменения своему делегату. Не забудьте установить делегат перед создания поповера.\nСупермен\n8. Тоже самое сделать с образованием. Образование это список типа, неполное среднее, среднее, неполное высшее, высшее и тд, то есть если делать в сегментед контролах, то не поместится.\n9. Когда нажимаем на образование, появляется поповер с контроллером и таблицей. Причем, выбранное образование должно быть отмечено чекбоксом. (кстати выбранная дата рождения в мастере тоже должна стоять по умолчанию в новом поповере)\n10. У этого контроллера тоже должен быть делегат. По нажатию на ячейку вы должны изменить текущий выбор на новый (поменять чекбокс) и передать сообщение делегату, после чего тот должен изменить содержимое текст филда\nВот такое вот задание, а что вы хотели, это вам не хиханьки хахоньки :) Работать надо, много причем, детский сад закончился :)";
    
    
    self.textView = textView;
    
    self.textView.delegate = self;
    [self.view addSubview:textView];
    
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return NO;
}

- (void)cancelPressed:(id)sender {
    [self.delegate hidePopOver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
