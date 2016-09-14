import { Component, ViewChild, Input } from '@angular/core';

import { ModalDirective } from 'ng2-bootstrap/ng2-bootstrap';
//import * as moment from 'moment';

@Component({
  selector: 'key-edit',
  template: `
  <div bsModal #smModal="bs-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" aria-label="Close" (click)="smModal.hide()">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title">{{title}} {{key.title}}</h4>
        </div>
        <div class="modal-body text-left">
          <form name=key-edit-form>
            <div class="form-group">
              <label>Title: </label>
              <input [(ngModel)]="key.title" name="title" class="form-control"/>
            </div>
            <div class="form-group">
              <label>User Name: </label>
              <input [(ngModel)]="key.userName" name="userName" class="form-control"/>
            </div>
            <div class="form-group">
              <label>URL: </label>
              <input [(ngModel)]="key.url" name="url" class="form-control"/>
            </div>
            <div class="form-group">
              <label>Password: </label>
              <input type="password" [(ngModel)]="key.password" name="password" class="form-control"/>
            </div>
            <div class="form-group">
              <label>Comments: </label>
              <textarea [(ngModel)]="key.comments" name="Comment" class="form-control">
              </textarea>
            </div>
          </form>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" (click)="smModal.hide()">Close</button>
          </div>
        </div>
      </div>
    </div>
  </div>`,
})

export class KeyEditComponent {
  @ViewChild('smModal') smModal;

  key = {}; //TODO: There should be a better way to do this
  title = "";
  showEdit(key){
    this.key = key
    this.title = "Editing"
    this.smModal.show(); 
  }

  showNew(){
    this.title = "Creating"
    this.key = { 
      title: '',
      userName: '',
      url: '',
      password: '',
      comments: ''
    };
    this.smModal.show();
    return this.key;
  }
}
