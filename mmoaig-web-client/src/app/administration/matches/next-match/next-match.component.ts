import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { pluck, map, filter } from 'rxjs/operators';
import { ActivatedRoute } from '@angular/router';
import { JSONAPIListResponse, BackendMatchAttributes, BackendMatchListResponse } from '@mmoaig/mmoaig-core';

@Component({
  selector: 'mmo-next-match',
  templateUrl: './next-match.component.html',
  styleUrls: ['./next-match.component.css']
})
export class NextMatchComponent {
  constructor(private route: ActivatedRoute) {
  }

  get matchId(): Observable<string> {
    return this.match.pipe(pluck('id'));
  }

  get participants(): Observable<any> {
    return this.route.data.pipe(pluck('match', 'data', 'relationships', 'participants', 'data'));
  }

  get matchIsPending(): Observable<boolean> {
    return this.match
      .pipe(
        map((match: BackendMatchListResponse | null) => match !== null)
      );
  }

  get matchType(): Observable<any> {
    return this.match.pipe(pluck('attributes', 'type'));
  }

  get matchStatus(): Observable<any> {
    return this.match.pipe(pluck('attributes', 'status'));
  }

  private get match(): Observable<BackendMatchListResponse | null> {
    return this.route.data.pipe(pluck('match', 'data'));
  }
}
