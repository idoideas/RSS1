//
//  FLLMasterViewController.m
//  Ground
//
//  Created by idoideas on 1/24/14.
//  Copyright (c) 2014 idoideas. All rights reserved.
//

#import "FLLMasterViewController.h"

#import "FLLDetailViewController.h"

@interface FLLMasterViewController () {
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
}
@end

@implementation FLLMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    feeds = [[NSMutableArray alloc]init];
    NSURL *url = [NSURL URLWithString:@"http://movietogo1.bugs3.com/Joomla_3.2.1-Stable-Full_Package/index.php?option=com_content&view=featured&format=feed&type=rss"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    if ([element isEqualToString:@"item"]){
        item = [[NSMutableDictionary alloc] init];
        title = [[NSMutableString alloc] init];
        link = [[NSMutableString alloc]init];
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([element isEqualToString:@"title"]){
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]){
        [link appendString:string];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]){
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [feeds addObject:[item copy]];
    }
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self.TableView reloadData];
}
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.TableView indexPathForSelectedRow];
        NSString *string = [feeds [indexPath.row] objectForKey:@"link"];
        [[segue destinationViewController] setUrl:string];
    }
}

@end
