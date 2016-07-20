import { Pipe, PipeTransform } from '@angular/core';

/**
 * SIZE PIPE, 
 * DISK SIZE TRANSFORM, DEFAULT: 1KB = 1000 B;
 */
@Pipe({name: 'size'})
export class SizePipe implements PipeTransform {
  transform(value: number): string {
        if (value <= 0) {
            return "--";
        }
        var k = 1000, // or 1024
            sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
            i = Math.floor(Math.log(value) / Math.log(k));
        return (value / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
  }
}